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

    # DNS Over TLS
    services.resolved = {
        enable = true;
        extraConfig = ''
            [Resolve]
            DNS=45.90.28.0#b28d16.dns1.nextdns.io
            DNS=2a07:a8c0::#b28d16.dns1.nextdns.io
            DNS=45.90.30.0#b28d16.dns2.nextdns.io
            DNS=2a07:a8c1::#b28d16.dns2.nextdns.io
            DNSOverTLS=yes
        '';
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
        videoDrivers = [
            "intel"
            "nvidia"
        ];
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
            services.login.enableGnomeKeyring = true;
        };
    };

    # Daemons.
    services = {
        gvfs.enable = true;
        dbus.enable = true;
        upower.enable = true;
        urxvtd.enable = true;
        udisks2.enable = true;
        blueman.enable = true;
        openssh.enable = true;
        printing.enable = true;
        gnome.gnome-keyring.enable = true;
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
            options = "--delete-older-than 7d";
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
