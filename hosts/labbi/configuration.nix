{ config, pkgs, ... }:

{
  imports =
    [   # Include the results of the hardware scan.
        ./hardware-configuration.nix
    ];

    # Boot
    boot = {
        supportedFilesystems = [ "ntfs" ];
        kernelPackages = pkgs.linuxPackages_zen;
        loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
        };
    };

    # Networking
    networking  = {
        hostName = "labbi";
        wireless = {
            iwd.enable = true;
            interfaces = [ "wlan0" ];
        };
        useDHCP = false;
        interfaces.wlan0.useDHCP = true;
        interfaces.enp2s0.useDHCP = true;
    };

    # Bluetooth
    hardware.bluetooth = {
        enable = true;
        package = pkgs.bluez;
        powerOnBoot = false;
    };

    # Programs
    programs = {
        light.enable = true;
        adb.enable = true;
        htop.enable = true;
        gnupg.agent = {
            enable = true;
            enableSSHSupport = true;
        };
        npm = {
            enable = true;
            npmrc = ''
                prefix = /home/mahmoud/.npm
                color = true
            '';
        };
        java = {
            enable = true;
            package = pkgs.jdk;
        };
    };

    # Set your time zone.
    time.timeZone = "Africa/Cairo";

    # Select internationalisation properties.
    i18n = {
        defaultLocale = "en_US.UTF-8";
        extraLocaleSettings = {
            LC_TIME = "en_US.UTF-8";
            LC_MONETARY = "en_US.UTF-8";
        };
    };
    console = {
        font = "Lat2-Terminus16";
        useXkbConfig = true;
    };

    # X11 Windowing System.
    services.xserver = {
        enable = true;
        layout = "us,ara" ;
        xkbVariant = "qwerty";
        xkbOptions = "grp:alt_shift_toggle";
        displayManager.startx.enable = true;
        updateDbusEnvironment = true;
        libinput = {
            enable = true;
            touchpad = {
                tapping = true;
                disableWhileTyping = true;
            };
        };
    };

    # GPU
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia = {
        modesetting.enable = true;
        prime = {
            offload.enable = true;
            nvidiaBusId = "PCI:01:00:0";
            intelBusId = "PCI:00:02:0";
        };
        powerManagement = {
            enable = true;
            finegrained = true;
        };
    };

    # Sound.
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa = {
            enable = true;
            support32Bit = true;
        };
        audio.enable = true;
        jack.enable = true;
        pulse.enable = true;
        wireplumber.enable = true;
    };
    sound.enable = true;
    hardware.pulseaudio.enable = false;

    # User Account.
    users.users.mahmoud = {
        description = "Mahmoud Asran";
        isNormalUser = true;
        home = "/home/mahmoud";
        shell = pkgs.zsh;
        extraGroups = [ "wheel" "video" "audio" "users" "tty" "input" ];
        hashedPassword = "$6$RC/pIIRmYnXN6vWB$pkDeNbr/SewvTKH4oK5ZzXXdnx8/Az8Wxp0Bg1imM44ECcjmj/eLjSAm0yx6dbozZY0RAN5QXWr/vdQBo35Lq/";
    };
    environment.pathsToLink = [ "/share/zsh" ];

    # Packages installed in system profile.
    environment.systemPackages = with pkgs; [
        vim
        wget
        git
        man-pages
    ];

    # Enable nonFOSS.
    nixpkgs.config = {
        allowUnfree = true;
        input-fonts.acceptLicense = true;
    };

    # Security.
    security = {
        polkit = {
            enable = true;
            extraConfig = ''
                /* Allow members of the wheel group to execute any actions
                * without password authentication, similar to "sudo NOPASSWD:"
                */
                polkit.addRule(function(action, subject) {
                    if (subject.isInGroup("wheel")) {
                        return polkit.Result.YES;
                    }
                });
            '';
        };
        pam = {
            enableSSHAgentAuth = true;
            services.login.gnupg.enable = true;
        };
    };

    # Daemons.
    services = {
        gvfs.enable = true;
        upower.enable = true;
        urxvtd.enable = true;
        udisks2.enable = true;
        blueman.enable = true;
        openssh.enable = true;
        printing.enable = true;
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
            DEVICES_TO_DISABLE_ON_STARTUP = "bluetooth";
            RESTORE_DEVICE_STATE_ON_STARTUP = 1;

            # Disable on Network Connect
            DEVICES_TO_DISABLE_ON_LAN_CONNECT="wifi wwan"
            DEVICES_TO_DISABLE_ON_WIFI_CONNECT="wwan"
            DEVICES_TO_DISABLE_ON_WWAN_CONNECT="wifi"

            # Enable on Network Disconnect
            DEVICES_TO_ENABLE_ON_LAN_DISCONNECT="wifi wwan"
            DEVICES_TO_ENABLE_ON_WIFI_DISCONNECT=""
            DEVICES_TO_ENABLE_ON_WWAN_DISCONNECT=""
        };
    };

    # Fonts
    fonts = {
        fonts = with pkgs; [
            iosevka
            nerdfonts
            input-fonts
            dejavu_fonts
            jetbrains-mono
            amiri
            nika-fonts
            liberation_ttf
            noto-fonts
            noto-fonts-emoji
            roboto
            fira
            fira-code
            siji
            unifont
        ];
        fontDir.enable = true;
        fontconfig = {
            enable = true;
            antialias = true;
            hinting.enable = false;
        };
    };

    # Nix
    nix = {
        package = pkgs.nixUnstable;
        extraOptions = ''
            experimental-features = nix-command flakes
            keep-outputs = false
            keep-derivations = false
        '';
        settings = {
            auto-optimise-store = true;
            trusted-users = [
                "root"
                "mahmoud"
            ];
        };
        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 14d";
        };
    };

    # NixOS
    system = {
        autoUpgrade = {
            enable = true;
            channel = "https://nixos.org/channels/nixos-unstable";
        };
        stateVersion = "22.05";
    };
}
