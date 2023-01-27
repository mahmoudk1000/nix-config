{ config, pkgs, theme, ... }:

{
    services.polybar = {
        enable = false;
        script = ''
            # WM does this job
        '';
        package = pkgs.polybar.override {
            alsaSupport = true;
            pulseSupport = true;
        };
        config =  {
            "bar/main" = {
                font-0 = "Iosevka:style=Heavy Extended Oblique::size=9;4";
                monitor = "eDP-1";
                height = 35;
                width = "100%";
                offset-x = "0%";
                offset-y = 0;
                bottom = "true";
                module-margin = 2;
                padding = 3;
                fixed-center = true;
                wm-restack = "generic";
                modules-left = "ewmh";
                modules-center= "time";
                modules-right = "bluetooth pulseaudio backlight battery";
                background = theme.base00;
                foreground = theme.base01;
            };
            "module/ewmh" = {
                type = "internal/xworkspaces";
                icon-0 = "1;I";
                icon-1 = "2;II";
                icon-2 = "3;III";
                icon-3 = "4;IV";
                icon-4 = "5;V";
                icon-5 = "6;VI";
                enable-click = true;
                label-active = "%icon%";
                label-active-padding = 2;
                label-active-foreground = theme.base07;
                label-occupied = "%icon%";
                label-occupied-padding = 2;
                label-occupied-foreground = theme.base09;
                label-empty = "%icon%";
                label-empty-padding = 2;
                label-empty-foreground = theme.base02;
                label-urgent = "%icon%";
                label-urgent-padding = 2;
                label-urgent-foreground = theme.base03;
            };
            "module/battery" = {
                type = "internal/battery";
                full-at = 99;
                battery = "BAT0";
                adapter = "ADP0";
                poll-interval = 5;
                format-charging = "CHR: <label-charging>";
                format-charging-foreground = theme.base08;
                format-discharging = "BAT: <label-discharging>";
                format-discharging-foreground = theme.base08;
                format-full = "BAT: <label-full>";
                format-full-foreground = theme.base07;
            };
            "module/backlight" = {
                type = "custom/script";
                exec = ''echo "$(light | cut -d. -f1)%"'';
                format = "LIT: <label>";
                format-foreground = theme.base03;
                interval = 0;
            };
            "module/pulseaudio" = {
                type = "internal/pulseaudio";
                label-volume =  "%percentage%";
                format-volume = "VOL: <label-volume>%";
                format-volume-foreground = theme.base05;
                label-muted = " Muted";
                label-muted-foreground = theme.base05;
            };
            "module/time" = {
                type = "internal/date";
                interval = 1;
                time = "%H : %M";
                date = "%d  %b •";
                label = "%date% %time%";
                format = "<label>";
                format-foreground = theme.base04;
            };
            "module/bluetooth" = {
                type = "custom/script";
                interval = 1;
                exec = "~/.bin/rofi-bluetooth --status";
                format = "BLU: <label>";
                format-foreground = theme.base06;
            };
        };
    };
}
