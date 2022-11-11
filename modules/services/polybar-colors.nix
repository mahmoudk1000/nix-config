{ config, pkgs, theme, ... }:

{
    services.polybar = {
        enable = true;
        script = ''
            # WM does this job
        '';
        package = pkgs.polybar.override {
            alsaSupport = true;
            pulseSupport = true;
        };
        config =  {
            "bar/main" = {
                font-0 = "Iosevka:style=Semibold:size=9;3";
                font-1 = "NotoMono Nerd Font:size=10;3";
                monitor = "eDP1";
                height = 35;
                width = "80%";
                offset-x = "10%";
                offset-y = 0;
                bottom = "true";
                border-size = 0;
                module-margin = 0;
                padding = 3;
                radius-top = 4;
                underline-size = 3;
                fixed-center = true;
                wm-restack = "generic";
                modules-left = "ewmh";
                modules-center= "time";
                modules-right = "pulseaudio backlight bluetooth battery";
                background = theme.base00;
                border-color = theme.base09;
                foreground = theme.base01;
            };
            "module/ewmh" = {
                type = "internal/xworkspaces";
                enable-click = true;
                enable-scroll = true;
                label-active = "⭕";
                label-active-padding = 1;
                label-active-foreground = theme.base07;
                label-active-underline = theme.base07;
                label-occupied = "⭕";
                label-occupied-padding = 1;
                label-occupied-foreground = theme.base09;
                label-occupied-underline = theme.base09;
                label-urgent = "⭕";
                label-urgent-padding = 1;
                label-urgent-foreground = theme.base03;
                label-urgent-underline = theme.base03;
                label-empty = "⬤";
                label-empty-padding = 1;
                label-empty-foreground = theme.base09;
                label-empty-underline = theme.base09;
            };
            "module/battery" = {
                type = "internal/battery";
                full-at = 99;
                battery = "BAT0";
                adapter = "ADP0";
                poll-interval = 5;
                format-charging = "ﮣ <label-charging>";
                format-charging-padding = 2;
                format-charging-foreground = theme.base08;
                format-charging-underline = theme.base08;
                format-discharging = " <label-discharging>";
                format-discharging-padding = 2;
                format-discharging-foreground = theme.base08;
                format-discharging-underline = theme.base08;
                format-full = " <label-full>";
                format-full-padding = 2;
                format-full-foreground = theme.base07;
                format-full-underline = theme.base07;
            };
            "module/backlight" = {
                type = "custom/script";
                exec = ''echo "$(light | cut -d. -f1)"'';
                format = " <label>";
                format-padding = 2;
                format-foreground = theme.base03;
                format-underline = theme.base03;
                interval = 0;
            };
            "module/pulseaudio" = {
                type = "internal/pulseaudio";
                label-volume =  "%percentage%";
                format-volume = "  <label-volume>";
                format-volume-padding = 2;
                format-volume-foreground = theme.base05;
                format-volume-underline = theme.base05;
                label-muted = "  Muted";
                label-muted-padding = 2;
                label-muted-foreground = theme.base05;
                label-muted-underline = theme.base05;
            };
            "module/time" = {
                type = "internal/date";
                interval = 1;
                time = "%H:%M";
                date = "%b %d,";
                format = "  <label>";
                format-padding = 2;
                format-foreground = theme.base04;
                format-underline = theme.base04;
                label = "%date% %time%";
            };
            "module/bluetooth" = {
                type = "custom/script";
                exec = "~/.bin/rofi-bluetooth --status";
                interval = 1;
                click-left = "~/.bin/rofi-bluetooth";
                format = "<label>";
                format-padding = 2;
                format-foreground = theme.base06;
                format-underline = theme.base08;
            };
        };
    };
}
