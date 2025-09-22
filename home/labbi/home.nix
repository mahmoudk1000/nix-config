{
  config,
  pkgs,
  host,
  stateVersion,
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
    inherit (host) username;
    inherit stateVersion;
    homeDirectory = "/home/${host.username}";
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
        libnotify

        mpc-cli
        xclip
        spotdl

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
        evince
        zoom-us

        xorg.xmodmap
      ])
      ++ (import ../../modules/scripts { inherit config pkgs lib; });

    sessionPath = [ "${config.home.homeDirectory}/.local/bin" ];

    sessionVariables = {
      BROWSER = "${config.programs.firefox.package}/bin/firefox";
      EDITOR = "nvim";
    };
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

  services = {
    batteryNotifier.enable = true;
    conkyWidget.enable = false;
    obsidian = {
      enable = true;
      gitSync = true;
      vaultDir = "/home/${host.username}/Notes/obsidian";
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
