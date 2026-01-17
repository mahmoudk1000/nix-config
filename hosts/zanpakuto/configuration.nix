{
  config,
  lib,
  pkgs,
  host,
  ...
}:

{
  imports = [
    ../common/local
    ../common/nix
  ];

  age = {
    secrets = {
      "users/${host.username}".file = ../../secrets/users/farouk.age;
    };
  };

  users.users = {
    root.hashedPasswordFile = config.age.secrets."users/${host.username}".path;
    ${host.username} = {
      description = "Mahmoud Farouk";
      isNormalUser = true;
      home = "/home/${host.username}";
      shell = pkgs.zsh;
      extraGroups = [
        "wheel"
        "audio"
        "users"
        "tty"
        "input"
        "disk"
        (lib.mkIf config.virtualisation.docker.enable "docker")
      ];
      hashedPasswordFile = config.age.secrets."users/${host.username}".path;
    };
  };

  services = {
    openssh = {
      enable = true;
      ports = [ 22 ];
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
      hostKeys = [
        {
          path = "/home/${host.username}/.ssh/id_ed25519";
          type = "ed25519";
        }
      ];
    };
  };

  wsl = {
    enable = true;
    defaultUser = "${host.username}";
    startMenuLaunchers = true;
    usbip = {
      enable = true;
    };
    wslConf = {
      interop = {
        enabled = false;
        appendWindowsPath = false;
      };
      automount.root = "/mnt";
      network = {
        generateHosts = true;
      };
    };
  };

  programs = {
    zsh.enable = true;
  };

  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
    };
  };

  # boot.isContainer = true;

  networking.hostName = "${host.hostName}";

  documentation = {
    dev.enable = true;
    man.generateCaches = true;
  };

  security.sudo.wheelNeedsPassword = false;

  systemd = {
    services = {
      "serial-getty@ttyS0".enable = false;
      "serial-getty@hvc0".enable = false;
      "getty@tty1".enable = false;
      "autovt@".enable = false;
      firewall.enable = false;
      systemd-udevd.enable = false;
      systemd-resolved.enable = false;
    };

    enableEmergencyMode = false;
  };

  environment = {
    pathsToLink = [ "/share/zsh" ];
    shells = [ config.users.users.${host.username}.shell ];
    systemPackages = with pkgs; [
      agenix
      vim
      wget
      git
      wslu
      wsl-open
      wsl-vpnkit
      man-pages
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
