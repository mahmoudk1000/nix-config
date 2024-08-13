{
  inputs,
  config,
  pkgs,
  labbi,
  ...
}:

{
  age.secrets = {
    "users/${labbi.user}".file = ../../../secrets/users/mahmoud.age;
  };
  # User Account.
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
      "docker"
      "adbusers"
      "libvirtd"
      "wireshark"
    ];
    hashedPasswordFile = config.age.secrets."users/${labbi.user}".path;
  };

  environment.pathsToLink = [ "/share/zsh" ];

  # Packages installed in system profile.
  environment.systemPackages =
    [ inputs.agenix.packages."${pkgs.system}".default ]
    ++ (with pkgs; [
      vim
      wget
      git
      man-pages
      _2bwm
      brightnessctl
      gptfdisk
    ]);

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
      nika-fonts
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
