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
    man = {
      cache = {
        enable = true;
      };
    };
  };

  environment = {
    systemPackages = with pkgs; [
      agenix
      vim
      wget
      git
      wsl-open
      wsl-vpnkit
      man-pages
    ];
  };
}
