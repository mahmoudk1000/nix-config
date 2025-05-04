# If you'd saved this configuration in ./disks/default.nix, and wanted to create a disk named /dev/nvme0n1, you would run the following command to partition, format and mount the disk.
# sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./disks/default.nix --arg device '"/dev/nvme0n1"'
{
  device ? throw "Set this to your disk device, e.g. /dev/sda",
  ...
}:
{
  disko = {
    # Do not let Disko manage fileSystems.* config for NixOS.
    # Reason is that Disko mounts partitions by GPT partition names, which are
    # easily overwritten with tools like fdisk. When you fail to deploy a new
    # config in this case, the old config that comes with the disk image will
    # not boot either.
    enableConfig = false;
    devices = {
      disk = {
        main = {
          inherit device;
          type = "disk";
          content = {
            type = "gpt";
            partitions = {
              boot = {
                name = "boot";
                size = "1M";
                type = "EF02";
              };
              esp = {
                name = "ESP";
                type = "EF00";
                size = "1G";
                label = "EFI";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                  mountOptions = [
                    "defaults"
                  ];
                };
              };
              # TODO: I want encrypted at some point
              # luks = {
              #   size = "100%";
              #   type = "8300";
              #   content = {
              #     type = "luks";
              #     name = "encrypted";
              #     extraOpenArgs = [ ];
              #     settings = {
              #       keyFile = "/tmp/secret.key";
              #       allowDiscards = true;
              #     };
              #     content = {
              #       type = "lvm_pv";
              #       vg = "vg0";
              #     };
              #   };
              primary = {
                name = "SYSTEM";
                size = "100%";
                content = {
                  type = "lvm_pv";
                  vg = "pool";
                };
              };
            };
          };
        };
      };
      lvm_pv = {
        pool = {
          type = "lvm_vg";
          lvs = {
            lv_root = {
              name = "root";
              size = "100G";
              content = {
                type = "filesystem";
                format = "ext4";
                subvolumes = {
                  "/root" = {
                    mountpoint = "/";
                  };
                  "/persist" = {
                    mountOptions = [
                      "subvol=persist"
                      "noatime"
                    ];
                    mountpoint = "/persist";
                  };
                  "/nix" = {
                    mountOptions = [
                      "subvol=nix"
                      "noatime"
                    ];
                    mountpoint = "/nix";
                  };
                };
                mountOptions = [
                  "defaults"
                  "noatime"
                  "compress=zstd"
                ];
                extraArgs = [
                  "-L ROOT"
                  "-f"
                ];
              };
            };
            lv_home = {
              name = "home";
              size = "100%FREE";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/home";
                mountOptions = [
                  "defaults"
                ];
                extraArgs = [ "-L home" ];
              };
            };
          };
        };
      };
      nodev = {
        "/" = {
          fsType = "tmpfs";
          mountOptions = [
            "size=16G"
          ];
        };
      };
    };
  };
}
