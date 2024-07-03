{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/gpu.nix
    ./modules/locale.nix
    ./modules/nixos.nix
    ./modules/programs.nix
    ./modules/security.nix
    ./modules/services.nix
    ./modules/sound.nix
    ./modules/user.nix
    ./modules/wireless.nix
  ];

  # Boot
  boot = {
    supportedFilesystems = [ "ntfs" ];
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
    loader = {
      systemd-boot = {
        enable = true;
      };
      efi.canTouchEfiVariables = true;
    };
    extraModulePackages = with config.boot.kernelPackages; [
      acpi_call
      cpupower
      perf
      nvidia_x11
    ];
  };

  documentation = {
    dev.enable = true;
    man.generateCaches = true;
  };

  # Docker
  virtualisation.docker.enable = true;

  # Zram
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 64;
  };
}
