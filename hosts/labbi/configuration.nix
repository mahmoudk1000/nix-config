{ config, pkgs, ... }:

{
  imports =
    [
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
        kernelPackages = pkgs.linuxPackages_zen;
        loader = {
            systemd-boot = {
                enable = true;
                configurationLimit = 5;
            };
            efi.canTouchEfiVariables = true;
        };
    };

    # Programs
    programs = {
        adb.enable = true;
        htop.enable = true;
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
    };

    # TLP. (https://linrunner.de/tlp/settings/)
    services.thermald.enable = true;
    services.tlp = {
        enable = true;
        settings = {
            CPU_BOOST_ON_AC = 1;
            CPU_BOOST_ON_BAT = 0;

            CPU_HWP_DYN_BOOST_ON_AC = 0;
            CPU_HWP_DYN_BOOST_ON_BAT = 1;

            ENERGY_PERF_POLICY_ON_AC = "performance";
            ENERGY_PERF_POLICY_ON_BAT = "powersave";

            CPU_SCALING_GOVERNOR_ON_AC = "performance";
            CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

            START_CHARGE_THRESH_BAT0 = 25;
            STOP_CHARGE_THRESH_BAT0 = 80;

            MAX_LOST_WORK_SECS_ON_AC = 15;
            MAX_LOST_WORK_SECS_ON_BAT = 60;

            DISK_IDLE_SECS_ON_AC = 0;
            DISK_IDLE_SECS_ON_BAT = 2;

            # Radio Device
            WIFI_PWR_ON_BAT = 1;
            RESTORE_DEVICE_STATE_ON_STARTUP = 1;

            # Disable on Network Connect
            DEVICES_TO_DISABLE_ON_LAN_CONNECT = "wifi wwan";
            DEVICES_TO_DISABLE_ON_WIFI_CONNECT = "wwan";

            # Enable on Network Disconnect
            DEVICES_TO_ENABLE_ON_LAN_DISCONNECT = "wifi wwan";
            DEVICES_TO_ENABLE_ON_WIFI_DISCONNECT = "";
        };
    };

    # Zram
    zramSwap = {
        enable = true;
        algorithm = "zstd";
        memoryPercent = 64;
    };
}
