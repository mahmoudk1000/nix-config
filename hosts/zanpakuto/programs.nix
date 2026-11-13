{
  pkgs,
  ...
}:

{
  programs = {
    zsh.enable = true;
  };

  virtualisation = {
    containers = {
      enable = true;
    };
    oci-containers = {
      backend = "podman";
    };
    podman = {
      enable = true;
      dockerCompat = true;
      dockerSocket.enable = true;
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
    extraInit = ''
      if [ -z "$DOCKER_HOST" -a -S "/run/user/$(id -u)/podman/podman.sock" ]; then
        export DOCKER_HOST="unix:///run/user/$(id -u)/podman/podman.sock"
      fi
    '';
    systemPackages = with pkgs; [
      agenix
      vim
      wget
      git
      wslview
      wsl-open
      wsl-vpnkit
      man-pages
    ];
  };
}
