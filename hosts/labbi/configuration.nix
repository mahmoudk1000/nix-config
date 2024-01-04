{ config, pkgs, lib, ... }:

{
  imports =
    [
        ./hardware-configuration.nix
        ./modules/sound.nix
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

    # NextDNS
    services.nextdns = {
        enable = true;
        arguments = [
            "-config" "b28d16"
            "-report-client-info"
            "-auto-activate"
        ];
    };

    # Bluetooth
    hardware.bluetooth = {
        enable = true;
        package = pkgs.bluez;
        powerOnBoot = false;
        settings = {
            General = {
                Enable = "Source,Sink,Media,Socket";
            };
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

    users.motd = with config; ''
        Host       ${networking.hostName}
        OS         NixOS ${system.nixos.release} (${system.nixos.codeName})
        Version    ${system.nixos.version}
        Kernel     ${boot.kernelPackages.kernel.version}
    '';

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
    services.xserver.videoDrivers = [ "intel" "nvidia" ];
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
    hardware.opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
        extraPackages = with pkgs; [
            intel-media-driver
            vaapiIntel
            vaapiVdpau
            libvdpau-va-gl
        ];
    };

    # User Account.
    users.users.mahmoud = {
        description = "Mahmoud Asran";
        isNormalUser = true;
        home = "/home/mahmoud";
        shell = pkgs.zsh;
        extraGroups = [ "wheel" "video" "audio" "users" "tty" "input" "docker" ];
        hashedPassword = "$6$RC/pIIRmYnXN6vWB$pkDeNbr/SewvTKH4oK5ZzXXdnx8/Az8Wxp0Bg1imM44ECcjmj/eLjSAm0yx6dbozZY0RAN5QXWr/vdQBo35Lq/";
    };
    environment.pathsToLink = [ "/share/zsh" ];

    # Packages installed in system profile.
    environment.systemPackages = with pkgs; [
        vim
        wget
        git
        man-pages
        _2bwm
        brightnessctl
    ] ++ (with config.boot.kernelPackages; [
        cpupower
        perf
    ]);

    # Settings
    nixpkgs.config = {
        "2bwm".patches = [
            ../../modules/patches/2bwm/momo-patch.diff
        ];

        st = {
            conf = builtins.readFile ../../modules/patches/st/config.h;
            extraLibs = with pkgs; [ harfbuzz gd glib ];
            patches = [
                ../../modules/patches/st/momo-patch.diff
            ];
        };

        allowUnfree = true;
        input-fonts.acceptLicense = true;
    };

    # Security.
    security = {
        rtkit.enable = true;
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

    # Fonts
    fonts = {
        packages = with pkgs; [
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
            ibm-plex
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

    # Zram
    zramSwap = {
        enable = true;
        algorithm = "zstd";
        memoryPercent = 64;
    };

    # Nix
    nix = {
        package = pkgs.nixUnstable;
        extraOptions = ''
            experimental-features = nix-command flakes
            warn-dirty = false
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
            enable = false;
            channel = "https://nixos.org/channels/nixos-unstable";
        };
        stateVersion = "22.05";
    };
}
