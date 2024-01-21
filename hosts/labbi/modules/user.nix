{ config
, pkgs
, ...
}:

{
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
      ../../../modules/patches/2bwm/momo-patch.diff
    ];

    st = {
      conf = builtins.readFile ../../../modules/patches/st/config.h;
      extraLibs = with pkgs; [ harfbuzz gd glib ];
      patches = [
        ../../../modules/patches/st/momo-patch.diff
      ];
    };

    allowUnfree = true;
    input-fonts.acceptLicense = true;
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

  users.motd = with config; ''
    Host       ${networking.hostName}
    OS         NixOS ${system.nixos.release} (${system.nixos.codeName})
    Version    ${system.nixos.version}
    Kernel     ${boot.kernelPackages.kernel.version}
  '';
}
