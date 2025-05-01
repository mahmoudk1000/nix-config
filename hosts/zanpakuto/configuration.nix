{
  config,
  lib,
  pkgs,
  host,
  inputs,
  ...
}:

{
  imports = [ ];

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

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
    };
    hostKeys = [
      {
        path = "/home/${host.username}/.ssh/id_ed25519";
        type = "ed25519";
      }
    ];
  };

  wsl = {
    enable = true;
    defaultUser = "${host.username}";
    startMenuLaunchers = true;
    docker-desktop.enable = true;
    wslConf = {
      ws12 = {
        networkingMode = "mirrored";
      };
      usbip.enable = true;
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
    docker = {
      enable = true;
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  boot.isContainer = true;

  networking.hostName = "${host.hostName}";

  documentation = {
    dev.enable = true;
    man.generateCaches = true;
  };

  security.sudo.wheelNeedsPassword = false;

  # Disable systemd units that don't make sense on WSL
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

  # Don't allow emergency mode, because we don't have a console.

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

  # Nix
  nix = {
    package = pkgs.nixVersions.latest;
    daemonIOSchedClass = "idle";
    daemonCPUSchedPolicy = "idle";
    daemonIOSchedPriority = 7;
    settings = {
      keep-outputs = false;
      keep-derivations = false;
      auto-optimise-store = true;
      builders-use-substitutes = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "@wheel"
      ];
      substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
        "https://cache.garnix.io"
        "https://fortuneteller2k.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        "fortuneteller2k.cachix.org-1:kXXNkMV5yheEQwT0I4XYh1MaCSz+qg72k8XAi2PthJI="
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
    registry.nixpkgs.flake = inputs.nixpkgs;
  };

  # NixOS
  system = {
    switch = {
      enable = false;
      enableNg = true;
    };
    autoUpgrade = {
      enable = false;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
