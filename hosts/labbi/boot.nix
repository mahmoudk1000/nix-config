{
  pkgs,
  ...
}:

{
  boot = {
    supportedFilesystems = [
      "xfs"
      "vfat"
      "ext4"
      "btrfs"
      "ntfs"
    ];
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot = {
        enable = true;
      };
      efi.canTouchEfiVariables = true;
    };
    kernelParams = [
      "snd_hda_intel.dmic_detect=0"
      "acpi_osi=Linux"
      "i915.enable_psr=0"
    ];
    tmp = {
      cleanOnBoot = true;
      useTmpfs = true;
    };
  };

  documentation = {
    dev.enable = true;
    man = {
      cache = {
        enable = true;
      };
    };
  };
}
