{ config, pkgs, ... }:

{
  imports = [
    ../_modules
    ./hardware-configuration.nix
  ];

  # Boot
  boot = {
    supportedFilesystems = [ "ntfs" ];
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
    initrd.systemd.enable = true;
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

  # Docker
  virtualisation.docker.enable = true;

  # Virtualisation
  programs.virt-manager.enable = true;
  virtualisation.libvirtd = {
    enable = true;
    onShutdown = "shutdown";
    qemu = {
      package = pkgs.qemu_kvm;
      swtpm.enable = true;
    };
  };

  # Zram
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 64;
  };
}
