{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ../_modules
    ./hardware-configuration.nix
  ];

  # Boot
  boot = {
    supportedFilesystems = lib.mkForce [
      "xfs"
      "vfat"
      "ext4"
    ];
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
    initrd.systemd.enable = false;
    loader = {
      systemd-boot = {
        enable = true;
      };
      efi.canTouchEfiVariables = true;
    };
    kernelParams = [
      "snd_hda_intel.dmic_detect=0"
      "acpi_osi=linux"
    ];
    extraModulePackages = with config.boot.kernelPackages; [
      acpi_call
      cpupower
      perf
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
}
