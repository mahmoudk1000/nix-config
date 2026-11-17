# Disk layouts (disko)

Disk layouts are **named profiles**, selected by name — exactly like themes
in [`../modules/themes`](../modules/themes). A host picks its layout with the
`diskProfile` key on its profile in `flake.nix` (plus `diskDevice`, the raw
disk); at install time you pick with `--arg profile <name>`.

```
disks/
├── default.nix          # the named selector + disko CLI entry
├── luks-btrfs-home.nix  # the only profile for now
└── README.md
```

The selected profile is consumed in **both** places, so it is the single
source of truth for the whole layout:

- the [disko](https://github.com/nix-community/disko) CLI writes the
  partitions at install time (`default.nix` is the CLI entry, exposed via the
  pinned flake app `.#disko`), and
- the NixOS side (`hosts/labbi/disko.nix`, `disko.enableConfig = true`)
  derives `fileSystems` and `boot.initrd.luks` from the same spec at
  evaluation time.

## Profiles

### `luks-btrfs-home`

LUKS2-encrypted btrfs root + unencrypted ext4 home.

| Part     | Size | Filesystem | Mountpoint |
| -------- | ---- | ---------- | ---------- |
| boot     | 1M   | GPT        |            |
| esp      | 1G   | vfat       | `/boot`    |
| ROOT     | 100G | LUKS2      |            |
| └ vol    |      | btrfs      |            |
|   root   |      | subvolume  | `/`        |
|   nix    |      | subvolume  | `/nix`     |
|   persist|      | subvolume  | `/persist` |
| home     | rest | ext4       | `/home`    |

`/` and `/nix` use `noatime,compress=zstd`. There is no swap partition —
swap is provided by zram (`hosts/labbi/virtualisation.nix`). `/persist` is
for data that should survive a reinstall of the system.

**Filesystem choices.** `ROOT` is btrfs: subvolumes for `/`, `/nix` and
`/persist` plus zstd compression are the standard NixOS best practice (and
leave room for btrfs snapshots later). `HOME` is ext4: mature,
zero-maintenance, and `/home` does not need snapshots. `ESP` is vfat because
UEFI requires it.

**`/home` is never inside LUKS.** In every profile `/home` lives on its own
unencrypted partition, so home data stays accessible even if the root key is
lost.

## Adding a profile

Copy `luks-btrfs-home.nix`, give it a name, and register it in the
`profiles` map in `default.nix`:

```nix
profiles = {
  luks-btrfs-home = import ./luks-btrfs-home.nix;
  # my-new-layout = import ./my-new-layout.nix;
};
```

The profile is an attrset with `description`, `luksName` (the LUKS device
name; may be absent for unencrypted layouts) and
`devices = { device, passwordFile }: { disk = { main = ...; }; };` — the
disko device table (keyed `disk.main` format) for a raw disk (`device`),
with the optional LUKS passphrase file (`passwordFile`, `null` for an
interactive prompt).

## The `disko` flag

The labbi host profile in `flake.nix` carries `disko = true`. The NixOS side
of the layout is only imported while the flag is on; with `disko = false`,
the legacy layout in `hosts/labbi/hardware.nix` (the old xfs root) is used
instead.

## LUKS

`ROOT` is wrapped in **LUKS2**. The passphrase lives in the repo as an
[agenix](https://github.com/ryantm/agenix) secret,
`secrets/systems/labbi-luks.age`, encrypted to the `systems.labbi` recipient
(`secrets/secrets.nix`).

**Auto-decrypt at boot.** This agenix setup decrypts secrets at activation
time — too late for the initrd. So when the secret exists,
`hosts/labbi/disko.nix` decrypts it **at build time**, embeds a copy in the
initrd via `boot.initrd.secrets`, and points LUKS at it with
`boot.initrd.luks.devices.ROOT.openFile` — the system unlocks the disk
automatically at boot. The age private key is read from
`/root/.ssh/keys/labbi.agekey` on the machine that builds the system
(override with the `luksAgeKeyFile` key on the labbi host profile if yours
lives elsewhere — it must be an absolute path readable by the nix daemon).

> [!WARNING]
> The keyfile also ends up in the initrd on the unencrypted ESP, so anyone
> with physical access to the machine can decrypt the disk. That is the
> inherent trade-off of auto-decrypt. Mitigations:
>
> - add your memorized passphrase as a **second, independent LUKS key slot**
>   (`sudo cryptsetup luksAddKey /dev/disk/by-partlabel/ROOT`) so you can
>   always boot manually (and the machine is still usable if the secret or
>   the auto-decrypt wiring breaks), and
> - delete `secrets/systems/labbi-luks.age` to fall back to the interactive
>   passphrase prompt at boot (the config remains evaluable without it).

**Creating the secret (once).**

```shell
# 1. Generate a strong passphrase (or use one you already have)
openssl rand -base64 48 > /tmp/labbi-luks-passphrase

# 2. Generate the age key for the labbi system, install it where the
#    build-time decryption can find it
mkdir -p ~/.ssh/keys
age-keygen -o ~/.ssh/keys/labbi.agekey 2>/dev/null
sudo install -m 0600 ~/.ssh/keys/labbi.agekey /root/.ssh/keys/labbi.agekey

# 3. Encrypt the passphrase into the repo's secrets tree
agenix wrap /tmp/labbi-luks-passphrase \
  -r "$(age-keygen -y ~/.ssh/keys/labbi.agekey)" -s /systems/labbi-luks
# → secrets/systems/labbi-luks.age

# 4. Stage it — from this moment on the next rebuild wires auto-decrypt
git add secrets/systems/labbi-luks.age

# 5. Remove the plaintext
rm -P /tmp/labbi-luks-passphrase
```

(`agenix` / `age` are available via `nix run nixpkgs#agenix` / `nix run
nixpkgs#age` if not in your PATH.)

**Install-time use.** The disko CLI formats the LUKS partition
non-interactively with `--arg passwordFile <file>` (see the installation
steps below). Without a secret, pass a passphrase file you created yourself
— or omit `passwordFile` and disko will prompt for the passphrase
interactively on the live system.

## Installation (labbi)

The disk is (re)partitioned with disko — **one-time, destructive**.

```shell
# 1. Clone this repo
git clone <this-repo> /mnt/etc/nixos && cd /mnt/etc/nixos

# 2. (Once) create the LUKS passphrase secret — or skip for now and create
#    the secret later (see "LUKS" above)
# … see "Creating the secret" …

# 3. Partition, format and encrypt the disk (DESTRUCTIVE — back up first)
age -d -i /root/.ssh/keys/labbi.agekey secrets/systems/labbi-luks.age \
  > /tmp/labbi-luks-passphrase
sudo nix run .#disko -- --mode disko ./disks/default.nix \
  --argstr device /dev/nvme0n1 \
  --argstr passwordFile /tmp/labbi-luks-passphrase
rm -P /tmp/labbi-luks-passphrase

# 4. (Optional, recommended) add your memorized passphrase as a second
#    independent LUKS key slot, so you can always boot manually:
sudo cryptsetup luksAddKey /dev/disk/by-partlabel/ROOT

# 5. Sanity-check the result
lsblk
sudo blkid

# 6. Install the system
sudo nixos-rebuild boot --flake '.#labbi'
# reboot, then:
sudo nixos-rebuild switch --flake '.#labbi'
```

Note: `--argstr profile <name>` selects a different disk profile (default:
`luks-btrfs-home`); `--argstr device` must match `diskDevice` on the host
profile.

**The one-time re-partition.** The flag is committed as `true`. To actually
move an existing disk over:

1. Back up the disk (the disko run wipes it).
2. Boot a live environment and run the disko command above (the pinned disko
   version, matching the flake input).
3. Check with `lsblk` / `blkid`, then `nixos-rebuild boot --flake '.#labbi'`.

Until step 2 is done, keep `disko = false` on the labbi profile so rebuilds
keep pointing at the old layout.
