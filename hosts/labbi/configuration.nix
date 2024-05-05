{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/gpu.nix
    ./modules/locale.nix
    ./modules/nixos.nix
    ./modules/security.nix
    ./modules/sound.nix
    ./modules/user.nix
    ./modules/wireless.nix
  ];

  # Boot
  boot = {
    supportedFilesystems = [ "ntfs" ];
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
    loader = {
      systemd-boot = { enable = true; };
      efi.canTouchEfiVariables = true;
    };
    extraModulePackages = with config.boot.kernelPackages; [
      acpi_call
      cpupower
      perf
      nvidia_x11
    ];
  };

  # Programs
  programs = {
    adb.enable = true;
    zsh.enable = true;
    xfconf.enable = true;
    dconf.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    java = {
      enable = true;
      package = pkgs.jdk;
    };
    command-not-found.enable = false;
  };

  documentation = {
    dev.enable = true;
    man.generateCaches = true;
  };

  # Docker
  virtualisation.docker.enable = true;

  # Daemons.
  services = {
    gvfs.enable = true;
    upower.enable = true;
    udisks2.enable = true;
    blueman.enable = true;
    openssh.enable = true;
    printing.enable = true;
    tumbler.enable = true;
    thermald.enable = true;
  };

  # TLP. (https://linrunner.de/tlp/settings/)
  services.tlp = {
    enable = true;
    settings = {
      # CPU
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;

      CPU_HWP_DYN_BOOST_ON_AC = 0;
      CPU_HWP_DYN_BOOST_ON_BAT = 1;

      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";

      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "balanced";

      # Battery
      # START_CHARGE_THRESH_BAT0 = 25;
      # STOP_CHARGE_THRESH_BAT0 = 80;

      # Radio Device
      DEVICES_TO_ENABLE_ON_STARTUP = "wifi";
      DEVICES_TO_DISABLE_ON_STARTUP = "bluetooth";

      # Network Connect
      DEVICES_TO_DISABLE_ON_LAN_CONNECT = "wifi";
      DEVICES_TO_ENABLE_ON_LAN_DISCONNECT = "wifi";
    };
  };

  # Zram
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 64;
  };
}
