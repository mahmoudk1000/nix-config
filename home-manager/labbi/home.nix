{ config
, pkgs
, lib
, ...
}:

let
  obsidian = lib.throwIf (lib.versionOlder "1.5.3" pkgs.obsidian.version) "Obsidian no longer requires EOL Electron" (
    pkgs.obsidian.override {
    electron = pkgs.electron_25.overrideAttrs (_: {
        preFixup = "patchelf --add-needed ${pkgs.libglvnd}/lib/libEGL.so.1 $out/bin/electron"; # NixOS/nixpkgs#272912
        meta.knownVulnerabilities = [ ]; # NixOS/nixpkgs#273611
        });
    }
  );
in
{
  imports = [
    ../../modules/programs
    ../../modules/services
    ../../modules/x
  ];

  home = {
    username = "mahmoud";
    homeDirectory = "/home/mahmoud";
    stateVersion = "22.05";
    extraOutputsToInstall = [ "man" ];
    packages = with pkgs; [

      vim
      unzip
      curl
      wget
      jq
      playerctl
      pamixer
      isync
      bitwarden-cli
      pass
      libnotify

      psmisc
      mpc-cli
      ncmpcpp
      xclip
      pfetch
      spotdl
      ventoy-bin
      yt-dlp

      ffmpeg
      arandr
      imagemagick
      rtorrent
      nsxiv

      st
      zoom-us
      inkscape
      freetube
      libreoffice
      discord
      anki-bin
      spotify
      tdesktop
      element-desktop
      foliate
      obsidian
      evince
      mpv
      krita
      popcorntime

      libsForQt5.breeze-icons
      xorg.xmodmap

      ] ++ (import ../../modules/scripts { inherit config pkgs lib; });
  };

  xdg = {
    userDirs = {
    enable = true;
    desktop  = "${config.home.homeDirectory}/";
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
    nix-index ={
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

