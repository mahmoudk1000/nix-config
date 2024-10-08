{
  config,
  pkgs,
  labbi,
  lib ? pkgs.lib,
  ...
}:

{
  imports = [
    ../../modules/programs
    ../../modules/services
    ../../modules/x
  ];

  home = {
    username = "${labbi.user}";
    homeDirectory = "/home/${labbi.user}";
    stateVersion = "22.05";
    extraOutputsToInstall = [ "man" ];
    packages =
      (with pkgs; [
        vim
        unzip
        curl
        wget
        jq
        playerctl
        pamixer
        lastpass-cli
        libnotify

        mpc-cli
        xclip
        spotdl
        ventoy-bin

        ffmpeg
        arandr
        imagemagick
        rtorrent
        nsxiv

        st-flexipatch
        inkscape
        freetube
        libreoffice
        vesktop
        anki-bin
        tdesktop
        element-desktop
        foliate
        obsidian
        evince
        krita
        popcorntime
        zoom-us

        libsForQt5.breeze-icons
        xorg.xmodmap
      ])
      ++ (import ../../modules/scripts { inherit config pkgs lib; });

    sessionPath = [ "${config.home.homeDirectory}/.local/bin" ];
  };

  xdg = {
    userDirs = {
      enable = true;
      desktop = "${config.home.homeDirectory}/";
      documents = "${config.home.homeDirectory}/docs";
      download = "${config.home.homeDirectory}/download";
      music = "${config.home.homeDirectory}/musik";
      pictures = "${config.home.homeDirectory}/pics";
      videos = "${config.home.homeDirectory}/videos";
    };
  };

  programs = {
    devops.enable = true;
    home-manager.enable = true;
    nix-index = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  xsession = {
    enable = true;
    windowManager = {
      # command = "2bwm";
      bspwm.enable = false;
      herbstluftwm.enable = false;
      awesome.enable = true;
    };
  };

  systemd.user.startServices = "sd-switch";
}
