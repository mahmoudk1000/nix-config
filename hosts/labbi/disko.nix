# disko-managed disk layout + LUKS auto-decrypt for labbi
#
# The layout is a named disk profile selected with `host.diskProfile`
# (see disks/ — profiles are defined by name, like themes).
#
# One-time destructive install:
#   1. Back up the disk, boot the NixOS live USB.
#   2. Decrypt the LUKS secret (see disks/README.md):
#      age -d -i ~/.ssh/keys/labbi.agekey secrets/systems/labbi-luks.age \
#        > /tmp/labbi-luks-passphrase
#   3. Create the partitions and file systems:
#      sudo nix run .#disko -- --mode disko ./disks/default.nix \
#        --argstr device /dev/nvme0n1 \
#        --argstr passwordFile /tmp/labbi-luks-passphrase
#      (--arg profile <name> selects a different disk profile)
#   4. rm -P /tmp/labbi-luks-passphrase
#
# After that this module is applied on every generation: disko
# (enableConfig) derives the NixOS fileSystems and boot.initrd.luks
# settings from the same profile, so the layout and the boot config can
# never drift apart.
{
  config,
  host,
  pkgs,
  lib,
  ...
}:

let
  luksAgeFile = ../../secrets/systems/${host.hostName}-luks.age;

  # Automatic decryption only when the passphrase secret exists
  hasLuksSecret = builtins.pathExists luksAgeFile;

  # This agenix version decrypts at activation time — too late for the
  # initrd. Decrypt at build time instead and hand the keyfile to the
  # initrd via boot.initrd.secrets (see disks/README.md for the
  # trade-off).
  luksKeySource = pkgs.runCommand "labbi-luks-key" { nativeBuildInputs = [ pkgs.age ]; } ''
    age -d -i ${host.luksAgeKeyFile or "/root/.ssh/keys/${host.hostName}.agekey"} ${luksAgeFile} > $out
    chmod 0400 $out
  '';

  # The named disk profile for this host
  disk = import ../../disks/default.nix {
    profile =
      host.diskProfile
        or (throw "host '${host.hostName}': set host.diskProfile to a named disk profile (see disks/README.md)");
    device = host.diskDevice or "/dev/nvme0n1";
    # at runtime the secret is installed by agenix
    passwordFile = if hasLuksSecret then "/run/agenix/systems/${host.hostName}-luks" else null;
  };

  luksName = disk.profile.luksName;
in
{
  # LUKS passphrase secret (auto-decrypt); installed by agenix at activation
  age.secrets = lib.mkIf hasLuksSecret {
    "systems/${host.hostName}-luks" = {
      file = luksAgeFile;
      owner = "root";
    };
  };

  # Generate NixOS fileSystems + boot.initrd.luks from the profile
  disko = {
    enableConfig = true;
    devices = disk.disko.devices;
  };

  boot = lib.mkMerge [
    {
      # root lives on a btrfs subvolume
      initrd.availableKernelModules = [ "btrfs" ];
    }

    # LUKS auto-decrypt: passphrase keyfile in the initrd
    (lib.mkIf hasLuksSecret {
      initrd.luks.devices.${luksName}.keyFile = "/run/keys/root-luks";
      initrd.secrets."/run/keys/root-luks" = luksKeySource;
    })
  ];
}
