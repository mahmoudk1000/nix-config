{
  config,
  pkgs,
  host,
  osConfig,
  ...
}:

{
  imports = [
    ../../modules/programs/wsl.nix
  ];

  home = {
    inherit (host) username;
    inherit (osConfig.system) stateVersion;
    homeDirectory = "/home/${host.username}";
    extraOutputsToInstall = [ "man" ];
    packages = with pkgs; [
      vim
      unzip
      curl
      wget
      jq
      xclip
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
