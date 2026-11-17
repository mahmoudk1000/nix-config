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
      curl
      imagemagick
      jq
      pi-coding-agent
      unzip
      vim
      wget
      xdg-utils
      xsel
    ];
  };

  programs = {
    devops.enable = true;
    home-manager.enable = true;
    network.enable = true;
  };
}
