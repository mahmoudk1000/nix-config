{
  config,
  pkgs,
  lib,
  host,
  ...
}:

let
  cfg = config.programs.obsidian;
  gitSyncObsidian = pkgs.writeShellScriptBin "git-sync-obsidian" ''
    #!/usr/bin/env sh

    VAULT_DIR="${toString cfg.vaultDir}"

    cd $VAULT_DIR || exit 1

    git add .

    git commit -m "$(date '+%Y-%m-%d %H:%M:%S')" || exit 0

    git pull --rebase origin main || exit 1
    git push origin main
  '';
in
{
  options.programs.obsidian = {
    enable = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Enable Obsidian and its git sync script.";
    };
    gitSync = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable systemd git sync for Obsidian.";
    };
    vaultDir = lib.mkOption {
      type = lib.types.path;
      default = "/home/${host.username}/Notes/Obsidian";
      description = "Path to the Obsidian vault directory.";
    };
  };

  config = lib.mkIf cfg.enable {
    assertions = [
      {
        assertion = !(cfg.gitSync && cfg.vaultDir == null);
        message = "vaultDir must be set if gitSync is enabled.";
      }
    ];
    home.packages = [
      pkgs.obsidian
    ]
    ++ lib.optionals cfg.gitSync [ gitSyncObsidian ];
    systemd.user = lib.mkIf cfg.gitSync {
      timers.git-sync-obsidian = {
        Unit = {
          Description = "Git Sync Obsidian";
          After = [ "graphical-session.target" ];
        };
        Timer = {
          OnCalendar = "*:0/45";
          Unit = "git-sync-obsidian.service";
        };
        Install = {
          WantedBy = [ "timers.target" ];
        };
      };
      services.git-sync-obsidian = {
        Unit = {
          Description = "Git Sync Obsidian";
        };
        Service = {
          Type = "simple";
          ExecStart = "${gitSyncObsidian}/bin/git-sync-obsidian";
        };
      };
    };
  };
}
