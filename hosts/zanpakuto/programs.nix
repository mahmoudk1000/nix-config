{
  pkgs,
  ...
}:

{
  programs = {
    zsh.enable = true;
  };

  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
    };
  };

  documentation = {
    dev.enable = true;
    man.generateCaches = true;
  };

  environment = {
    systemPackages = with pkgs; [
      agenix
      vim
      wget
      git
      wslu
      wsl-open
      wsl-vpnkit
      man-pages
    ];
  };
}
