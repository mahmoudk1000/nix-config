{ config, pkgs, theme, ... }:

let
    blum-stat = pkgs.writeScriptBin "blum-stat" ''   
        if ${pkgs.bluez}/bin/bluetoothctl show | ${pkgs.gnugrep}/bin/grep -q "Powered: yes"; then
            ${pkgs.coreutils}/bin/echo "On"
        else
            ${pkgs.coreutils}/bin/echo "Off"
        fi
    '';
in
{
    services.polybar = {
        enable = true;
        script = ''
            polybar left &
            polybar right &
        '';
        package = pkgs.polybar.override {
            alsaSupport = true;
            pulseSupport = true;
            iwSupport = true;
        };
        config =  {
            "section/base" = {
                monitor = "eDP-1";
                bottom = true;
                height = 40;
                offset-y = "3%";
                module-margin = 1;
                fixed-center = false;
                wm-restack = "generic";
                border-size = 2;
                border-color = theme.base02;
                font-0 = "IosevkaTerm Nerd Font:style=Semibold:size=8;3";
                background = theme.base00;
                foreground = theme.base01;
            };
            "bar/right" = {
                "inherit" = "section/base";
                width = "15%";
                offset-x = "82.5%";
                modules-center = "pulseaudio  sep backlight sep bluetooth sep battery";
            };
            "bar/left" = {
                "inherit" = "section/base";
                width = "15%";
                offset-x = "2.5%";
                modules-center = "time sep ewmh";
            };
            "module/ewmh" = {
                type = "internal/xworkspaces";
                enable-scroll = false;
                label-active = "⭘";
                label-active-padding = 1;
                label-active-foreground = theme.base07;
                label-occupied = "⭘";
                label-occupied-padding = 1;
                label-occupied-foreground = theme.base09;
                label-urgent = "⭘";
                label-urgent-padding = 1;
                label-urgent-foreground = theme.base03;
                label-empty = "󰝥";
                label-empty-padding = 1;
                label-empty-foreground = theme.base09;
            };
            "module/battery" = {
                type = "internal/battery";
                full-at = 99;
                battery = "BAT0";
                adapter = "ADP0";
                poll-interval = 5;
                format-charging = "  <label-charging>";
                format-charging-foreground = theme.base04;
                format-discharging = "󰂎 <label-discharging>";
                format-discharging-foreground = theme.base06;
                format-full = "♥  <label-full>";
                format-full-foreground = theme.base03;
            };
            "module/backlight" = {
                type = "custom/script";
                exec = ''${pkgs.light}/bin/light | ${pkgs.coreutils}/bin/cut -d. -f1'';
                format = "  <label>%";
                format-forground = theme.base03;
                tail = true;
            };
            "module/pulseaudio" = {
                type = "internal/pulseaudio";
                format-volume = "  <label-volume>%";
                format-volume-foreground = theme.base05;
                label-volume =  "%percentage%";
                label-muted = "  Mute";
                label-muted-foreground = theme.base05;
            };
            "module/time" = {
                type = "internal/date";
                time = "%H:%M";
                date = "%b %d,";
                format = "<label>";
                format-foreground = theme.base04;
                label = "%date% %time%";
                label-padding-right = 1;
            };
            "module/bluetooth" = {
                type = "custom/script";
                tail = true;
                exec = "${blum-stat}/bin/blum-stat";
                format = "  <label>";
                format-foreground = theme.base08;
            };
            "module/sep" = {
                type = "custom/text";
                content = "|";
                content-foreground = theme.base09;
            };
        };
    };
}
