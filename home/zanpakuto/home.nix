{
  pkgs,
  host,
  stateVersion,
  ...
}:

{
  imports = [
    ../../modules/programs/wsl.nix
  ];

  home = {
    inherit (host) username;
    inherit stateVersion;
    homeDirectory = "/home/${host.username}";
    extraOutputsToInstall = [ "man" ];
    packages = with pkgs; [
      vim
      unzip
      curl
      wget
      jq
      xsel
      imagemagick
      rtorrent
    ];
  };

  programs = {
    devops.enable = true;
    network.enable = false;
    home-manager.enable = true;
  };

  xdg = {
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = [ "wslview.desktop" ];
        "x-scheme-handler/http" = [ "wslview.desktop" ];
        "x-scheme-handler/https" = [ "wslview.desktop" ];
        "x-scheme-handler/about" = [ "wslview.desktop" ];
        "x-scheme-handler/unknown" = [ "wslview.desktop" ];
        "application/pdf" = [ "wslview.desktop" ];
        "x-scheme-handler/mailto" = [ "wslview.desktop" ];
        "application/xhtml+xml" = [ "wslview.desktop" ];
      };
    };
  };
}
