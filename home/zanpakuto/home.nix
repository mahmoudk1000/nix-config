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
}
