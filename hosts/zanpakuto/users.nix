{
  config,
  pkgs,
  host,
  lib,
  ...
}:

{
  age = {
    secrets = {
      "users/${host.username}".file = ../../secrets/users/farouk.age;
    };
  };

  users.users = {
    root.hashedPasswordFile = config.age.secrets."users/${host.username}".path;
    ${host.username} = {
      description = "Mahmoud Farouk";
      isNormalUser = true;
      home = "/home/${host.username}";
      shell = pkgs.zsh;
      extraGroups = [
        "wheel"
        "audio"
        "users"
        "tty"
        "input"
        "disk"
        (lib.mkIf config.virtualisation.docker.enable "docker")
      ];
      hashedPasswordFile = config.age.secrets."users/${host.username}".path;
    };
  };

  security.sudo.wheelNeedsPassword = false;

  environment = {
    pathsToLink = [ "/share/zsh" ];
    shells = [ config.users.users.${host.username}.shell ];
  };
}
