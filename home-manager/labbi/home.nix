{
  config,
  pkgs,
  user,
  ...
}:

{
  imports = [
    ../../modules/programs
    ../../modules/services
    ../../modules/x
  ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    stateVersion = "22.05";
    extraOutputsToInstall = [ "man" ];
    packages =
      with pkgs;
      [

        vim
        unzip
        curl
        wget
        jq
        playerctl
        pamixer
        bitwarden-cli
        pass
        libnotify

        mpc-cli
        xclip
        pfetch
        spotdl
        ventoy-bin

        ffmpeg
        arandr
        imagemagick
        rtorrent
        nsxiv

        st-flexipatch
        zoom-us
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

        libsForQt5.breeze-icons
        xorg.xmodmap
      ]
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
