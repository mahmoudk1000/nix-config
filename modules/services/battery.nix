{ config
, pkgs
, lib
, ...
}:
let
  cfg = config.services.batteryNotifier;

  script = pkgs.writeScriptBin "bat" ''
    #!${pkgs.stdenv.shell}
    export battery_capacity=$(${pkgs.coreutils}/bin/cat /sys/class/power_supply/${cfg.device}/capacity)
    export battery_status=$(${pkgs.coreutils}/bin/cat /sys/class/power_supply/${cfg.device}/status)

    if [[ $battery_capacity -le ${builtins.toString cfg.notifyCapacity} && $battery_status = "Discharging" ]]; then
      ${pkgs.libnotify}/bin/notify-send --urgency=critical --hint=int:transient:1 "Battery Low: $battery_capacity%"
    fi

    if [[ $battery_capacity -le ${builtins.toString cfg.suspendCapacity} && $battery_status = "Discharging" ]]; then
      ${pkgs.libnotify}/bin/notify-send --urgency=critical --hint=int:transient:1 "Battery Critically Low: $battery_capacity%"
      sleep 60s
      battery_status=$(${pkgs.coreutils}/bin/cat /sys/class/power_supply/${cfg.device}/status)
      if [[ $battery_status = "Discharging" ]]; then
        systemctl suspend
      fi
    fi
  '';
in
{
  options = {
    services.batteryNotifier = {
      enable = lib.mkOption {
        default = false;
        description = ''
          Whether to enable battery notifier.
          '';
      };
      device = lib.mkOption {
        default = "BAT0";
        description = ''
          Device to monitor.
          '';
      };
      notifyCapacity = lib.mkOption {
        default = 15;
        description = ''
          Battery level at which a notification shall be sent.
          '';
      };
      suspendCapacity = lib.mkOption {
        default = 5;
        description = ''
          Battery level at which a suspend unless connected shall be sent.
          '';
      };
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.user.timers.lowBatt = {
      Unit = {
        Description = "Timer of Battery Level Checker";
        After = [ "graphical-session.target" ];
      };
      Timer = {
        OnCalendar = "*-*-* *:0/2:00";
        Unit = "lowBatt.service";
      };
      Install = {
        WantedBy = [ "timers.target" ];
      };
    };
    systemd.user.services.lowBatt = {
      Unit = {
        Description = "Battery Level Notifier & Acter";
      };
      Service = {
        Type = "simple";
        Environment = "PATH=/run/wrappers/bin";
        PassEnvironment = "DISPLAY";
        ExecStart = "${script}/bin/bat";
      };
    };
  };
}
