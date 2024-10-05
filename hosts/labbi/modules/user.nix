{
  config,
  pkgs,
  labbi,
  lib,
  ...
}:

{
  age = {
    identityPaths = [
      "/home/${labbi.user}/.ssh/id_rsa"
      "/home/${labbi.user}/.ssh/id_ed25519"
    ];
    secrets = {
      "users/${labbi.user}".file = ../../../secrets/users/mahmoud.age;
    };
  };

  # System Users
  users.users.root.hashedPasswordFile = config.age.secrets."users/${labbi.user}".path;
  users.users.${labbi.user} = {
    description = "Mahmoud Asran";
    isNormalUser = true;
    home = "/home/${labbi.user}";
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "video"
      "audio"
      "users"
      "tty"
      "input"
      (lib.mkIf config.virtualisation.docker.enable "docker")
      (lib.mkIf config.programs.adb.enable "adbusers")
      (lib.mkIf config.virtualisation.libvirtd.enable "libvirtd")
      "wireshark"
    ];
    hashedPasswordFile = config.age.secrets."users/${labbi.user}".path;
  };

  environment.pathsToLink = [ "/share/zsh" ];

  # Packages installed in system profile.
  environment.systemPackages = with pkgs; [
    agenix
    vim
    wget
    git
    man-pages
    _2bwm
    brightnessctl
    gptfdisk
  ];

  # Settings
  nixpkgs.config = {
    "2bwm".patches = [ ../../../modules/patches/2bwm/momo-patch.diff ];

    allowUnfree = true;
    input-fonts.acceptLicense = true;
  };

  # Fonts
  fonts = {
    fontDir.enable = true;
    fontconfig = {
      enable = true;
      antialias = true;
      hinting.enable = false;
    };
    packages = with pkgs; [
      iosevka
      nerdfonts
      input-fonts
      dejavu_fonts
      jetbrains-mono
      amiri
      liberation_ttf
      noto-fonts
      noto-fonts-emoji
      ibm-plex
      roboto
      fira
      fira-code
      unifont
    ];
  };

  users.motd = with config; ''
    Host       ${networking.hostName}
    OS         NixOS ${system.nixos.release} (${system.nixos.codeName})
    Version    ${system.nixos.version}
    Kernel     ${boot.kernelPackages.kernel.version}
  '';
}
