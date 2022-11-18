{ config, pkgs, theme, ... }:

{
    services.polybar = {
        enable = true;
        script = ''
            # Bspwm does this job
        '';
        package = pkgs.polybar.override {
            alsaSupport = true;
            pulseSupport = true;
        };
        config =  {
            "bar/ein" = {
                monitor = "eDP-1";
                bottom = true;
                height = 40;
                offset-y = 10;
                module-margin = 1;
                fixed-center = true;
                wm-restack = "bspwm";
                override-redirect = true;
                border-size = 5;
                border-color = theme.base02;
                font-0 = "Iosevka:style=Semibold:size=10;3";
                font-1 = "Material Design Icons Desktop:size=10;3";
                background = theme.base00;
                foreground = theme.base01;
                width = "15%";
                offset-x = 10;
                modules-center = "bspwm";
            };
            "bar/zwei" = {
                monitor = "eDP1";
                bottom = true;
                height = 40;
                offset-y = 10;
                module-margin = 1;
                fixed-center = true;
                wm-restack = "bspwm";
                override-redirect = true;
                border-size = 5;
                border-color = theme.base02;
                font-0 = "Iosevka:style=Semibold:size=10;3";
                font-1 = "Material Design Icons Desktop:size=10;3";
                background = theme.base00;
                foreground = theme.base01;
                width = "10%";
                offset-x = 864;
                modules-center = "time";
            };
            "bar/drei" = {
                monitor = "eDP1";
                bottom = true;
                height = 40;
                offset-y = 10;
                module-margin = 1;
                fixed-center = true;
                wm-restack = "bspwm";
                override-redirect = true;
                border-size = 5;
                border-color = theme.base02;
                font-0 = "Iosevka:style=Semibold:size=10;3";
                font-1 = "Material Design Icons Desktop:size=10;3";
                background = theme.base00;
                foreground = theme.base01;
                width = "15%";
                offset-x = 1622;
                modules-center = "pulseaudio backlight bluetooth battery";
            };
            "module/bspwm" = {
                type = "internal/bspwm";
                enable-click = true;
                enable-scroll = true;
                label-focused = "⭕";
                label-focused-padding = 1;
                label-focused-foreground = theme.base07;
                label-occupied = "⭕";
                label-occupied-padding = 1;
                label-occupied-foreground = theme.base09;
                label-urgent = "⭕";
                label-urgent-padding = 1;
                label-urgent-foreground = theme.base03;
                label-empty = "⬤";
                label-empty-padding = 1;
                label-empty-foreground = theme.base09;
            };
            "module/battery" = {
                type = "internal/battery";
                full-at = 99;
                battery = "BAT0";
                adapter = "ADP0";
                poll-interval = 5;
                format-charging = "󰂄 <label-charging>";
                format-charging-foreground = theme.base06;
                format-discharging = "󰁿 <label-discharging>";
                format-discharging-foreground = theme.base06;
                format-full = "󰁹 <label-full>";
                format-full-foreground = theme.base07;
            };
            "module/backlight" = {
                type = "custom/script";
                format = "󰛨 <label>";
                format-foreground = theme.base03;
                exec = ''echo "$(light | cut -d. -f1)"'';
                interval = 0;
            };
            "module/pulseaudio" = {
                type = "internal/pulseaudio";
                format-volume = "󰕾 <label-volume>";
                format-volume-foreground = theme.base05;
                label-volume =  "%percentage%";
                label-muted = "Muted";
                label-muted-foreground = theme.base05;
            };
            "module/time" = {
                type = "internal/date";
                interval = 1;
                time = "%H:%M";
                date = "%b %d,";
                format = "󱑂 <label>";
                format-foreground = theme.base04;
                label = "%date% %time%";
            };
            "module/bluetooth" = {
                type = "custom/script";
                exec = "~/.bin/rofi-bluetooth --status";
                interval = 1;
                click-left = "~/.bin/rofi-bluetooth";
                format = "<label>";
                format-foreground = theme.base08;
            };
        };
    };
}
