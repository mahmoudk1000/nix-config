{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ../common
    ./hardware-configuration.nix
  ];

  # Boot
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

  # Virtualisation
  programs.virt-manager.enable = lib.mkIf config.virtualisation.libvirtd.enable true;

  virtualisation = {
    docker = {
      enable = true;
    };
    libvirtd = {
      enable = true;
      onShutdown = "shutdown";
      qemu = {
        package = pkgs.qemu_kvm;
        swtpm.enable = true;
      };
    };
  };

  # Zram
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 64;
  };

  system.stateVersion = "22.05";
}
