{
  config,
  pkgs,
  ...
}:

{
  boot = {
    supportedFilesystems = [
      "xfs"
      "vfat"
      "ext4"
      "ntfs"
    ];
    kernelPackages = pkgs.linuxPackages_latest;
    initrd.systemd.enable = false;
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
    man.generateCaches = true;
  };
}
