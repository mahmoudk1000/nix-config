{
  config,
  pkgs,
  host,
  osConfig,
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
    inherit (osConfig.system) stateVersion;
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
        # zoom-us
        (pkgs.zoom-us.overrideAttrs {
          version = "6.2.11.5069";
          src = pkgs.fetchurl {
            url = "https://zoom.us/client/6.2.11.5069/zoom_x86_64.pkg.tar.xz";
            hash = "sha256-k8T/lmfgAFxW1nwEyh61lagrlHP5geT2tA7e5j61+qw=";
          };
        })
        teams-for-linux

        libsForQt5.breeze-icons
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
