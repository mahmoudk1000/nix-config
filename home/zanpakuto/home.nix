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
      opencode
    ];
  };

  programs = {
    devops.enable = true;
    home-manager.enable = true;
    network.enable = false;
  };
}
