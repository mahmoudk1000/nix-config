{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.xsession.windowManager.awesome.awedots;
in
{
  options = {
    xsession.windowManager.awesome.awedots = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Enable the awedots configuration.";
      };
      repository = lib.mkOption {
        type = lib.types.str;
        default = "https://github.com/mahmoudk1000/awedots/";
        description = "Repository for the awedots configuration.";
      };
      path = lib.mkOption {
        type = lib.types.str;
        default = "${config.home.homeDirectory}/.config/awesome";
        description = "Path to clone the awedots repository.";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home.activation = {
      awedots = config.home-manager.users.${config.user}.lib.dag.entryAfter [ "writeBoundary" ] ''
        if [ ! -d "${cfg.path}" ]; then
          ${pkgs.git}/bin/git clone ${cfg.repository} ${cfg.path}
        fi
      '';
    };
  };
}
