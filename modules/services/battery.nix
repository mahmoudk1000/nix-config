{ config, lib, pkgs, ... }:

let
    cfg = config.services.batteryNotifier;
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
                default = 10;
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
            wantedBy = [ "timers.target" ];
            description = "Timer of Battery Level Checker";
            timerConfig = {
                OnBootSec = "2m";
                OnUnitInactiveSec = "2m";
                Unit = "lowBatt.service";
            };
        };
        systemd.user.services.lowBatt = {
            description = "Battery Level Notifier & Acter";
            serviceConfig.PassEnvironment = "DISPLAY";
            script = ''
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
        };
    };
}
