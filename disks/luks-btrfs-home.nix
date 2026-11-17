# luks(btrfs)+home — LUKS2-encrypted btrfs root + plain /home
#
# The only disk profile for now. `ROOT` is LUKS2 over a btrfs volume with
# subvolumes for /, /nix and /persist; /home lives on its own unencrypted
# partition in every profile, so home data stays accessible even if the
# root key is lost.
#
# Layout:
#   part      size   fs       mount
#   boot      1M     GPT      -
#   ESP       1G     vfat     /boot
#   ROOT      100G   LUKS2    -
#     ROOT    rest   btrfs    -
#       root              subvolume  /
#       nix               subvolume  /nix
#       persist           subvolume  /persist
#   HOME      100%   ext4     /home
{
  description = "LUKS2-encrypted btrfs root (/, /nix, /persist) + unencrypted ext4 /home";

  # LUKS device name: dm mapper name (/dev/mapper/ROOT) and
  # boot.initrd.luks key.
  luksName = "ROOT";

  # Build the disko device table for a raw disk:
  #   - device:       the raw disk (e.g. /dev/nvme0n1)
  #   - passwordFile: file with the LUKS passphrase, to set the initial key
  #                   slot at install time (null → interactive prompt)
  devices =
    { device, passwordFile }:
    {
      disk = {
        main = {
          inherit device;
          type = "disk";
          content = {
            type = "gpt";
            partitions = {
              # GPT protective boot record
              boot = {
                name = "boot";
                type = "EF02";
                size = "1M";
              };

              # UEFI ESP for the systemd-boot EFI stub
              esp = {
                name = "ESP";
                type = "EF00";
                size = "1G";
                label = "ESP";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                  mountOptions = [ "defaults" ];
                };
              };

              # Encrypted root
              root = {
                name = "ROOT";
                size = "100G";
                label = "ROOT";
                content = {
                  type = "luks";
                  name = "ROOT";
                  inherit passwordFile;
                  content = {
                    type = "btrfs";
                    extraArgs = [
                      "-L"
                      "ROOT"
                      "-f"
                    ];
                    subvolumes = {
                      root = {
                        name = "root";
                        mountpoint = "/";
                        mountOptions = [
                          "noatime"
                          "compress=zstd"
                        ];
                      };
                      nix = {
                        name = "nix";
                        mountpoint = "/nix";
                        mountOptions = [
                          "noatime"
                          "compress=zstd"
                        ];
                      };
                      persist = {
                        name = "persist";
                        mountpoint = "/persist";
                        mountOptions = [ "noatime" ];
                      };
                    };
                  };
                };
              };

              # Unencrypted home, on its own partition
              home = {
                name = "HOME";
                size = "100%";
                label = "HOME";
                content = {
                  type = "filesystem";
                  format = "ext4";
                  mountpoint = "/home";
                  extraArgs = [
                    "-L"
                    "HOME"
                    "-f"
                  ];
                };
              };
            };
          };
        };
      };
    };
}
