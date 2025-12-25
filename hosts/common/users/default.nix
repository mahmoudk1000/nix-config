{
  config,
  pkgs,
  host,
  lib,
  ...
}:

{
  age = {
    identityPaths = [
      "/home/${host.username}/.ssh/id_rsa"
      "/home/${host.username}/.ssh/id_ed25519"
    ];
    secrets = {
      "users/${host.username}".file = ../../../secrets/users/mahmoud.age;
    };
  };

  # System Users
  users.users = {
    root.hashedPasswordFile = config.age.secrets."users/${host.username}".path;
    ${host.username} = {
      description = "Mahmoud Asran";
      isNormalUser = true;
      home = "/home/${host.username}";
      shell = pkgs.zsh;
      extraGroups = [
        "wheel"
        "video"
        "audio"
        "users"
        "tty"
        "input"
        "disk"
        (lib.mkIf config.virtualisation.docker.enable "docker")
        (lib.mkIf config.programs.adb.enable "adbusers")
        (lib.mkIf config.virtualisation.libvirtd.enable "libvirtd")
        "wireshark"
        "polkituser"
      ];
      hashedPasswordFile = config.age.secrets."users/${host.username}".path;
    };
  };

  # Packages installed in system profile.
  environment = {
    pathsToLink = [ "/share/zsh" ];
    shells = [ config.users.users.${host.username}.shell ];
    systemPackages = with pkgs; [
      agenix
      vim
      wget
      git
      man-pages
      brightnessctl
      gptfdisk
    ];
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
      amiri
      dejavu_fonts
      fira
      fira-code
      ibm-plex
      iosevka
      jetbrains-mono
      liberation_ttf
      nerd-fonts.iosevka-term
      nerd-fonts.noto
      noto-fonts
      noto-fonts-color-emoji
      roboto
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
