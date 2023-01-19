{ config, pkgs, theme, ... }:

{
    xsession = {
        windowManager.herbstluftwm = {
            tags = [ "2" "3" "4" "5" "6" ];
            settings = {
                window_gap = 10;
                window_border_width = 10;
                smart_window_surroundings = 0;
                smart_frame_surroundings = 0;
                always_show_frame = "on";
                frame_padding = 0;
                frame_border_normal_color = theme.base09;
                frame_border_active_color = theme.base02;
                frame_bg_normal_color = theme.base02;
                frame_bg_active_color = theme.base09;
                frame_border_width = 0;
                frame_bg_transparent = "on";
                frame_transparent_width = 0;
                frame_gap = 0;
                mouse_recenter_gap = 0;
                focus_follows_mouse = true;
                tree_style = ''╾│ ├└╼─┐'';
                default_frame_layout = 3;
                set_layout = "grid";
            };
            keybinds = {
                Mod4-q = "close";
                Mod4-Shift-r = "reload";

                Mod4-d = "spawn rofi -show drun";
                Mod4-b = "spawn ~/.bin/rofi-bluetooth";
                Mod4-p = "spawn ~/.bin/rofi-poww";

                Mod4-Return = "spawn urxvt";
                Mod4-a = "spawn anki";
                Mod4-f = "spawn thunar";
                Mod4-m = "spawn thunderbird";
                Mod4-o = "spawn obsidian";
                Mod4-t = "spawn telegram-desktop";
                Mod4-w = "spawn firefox";
                Mod4-l = "spawn betterlockscreen -l";

                Print = "spawn flameshot full";
                Shift-Print = "spawn flameshot gui";
                Mod1-Print = "spawn flameshot full -d 5000";

                XF86AudioMute = "spawn pamixer --toggle-mute";
                XF86AudioPlay = "spawn playerctl play-pause";
                XF86AudioNext = "spawn playerctl next";
                XF86AudioPrev = "spawn playerctl previous";
                XF86AudioRaiseVolume = "spawn pamixer -i 5";
                XF86AudioLowerVolume = "spawn pamixer -d 5";
                XF86MonBrightnessUp = "spawn light -A 10";
                XF86MonBrightnessDown = "spawn light -U 10";
                Control-XF86AudioNext = "spawn mpc next";
                Control-XF86AudioPrev = "spawn mpc prev";
                Control-XF86AudioPlay = "spawn mpc toggle";

                Mod4-Shift-e = "floating toggle";
                Mod4-Shift-f = "fullscreen toggle";
                Mod4-Shift-t = "pseudotile toggle";

                Mod4-Tab = "cycle";
                Mod4-space = "cycle_layout 1";
                Mod4-Shift-space = "cycle_layout -1";
                Mod4-Shift-a = "use_index -1 --skip-visible";
                Mod4-Shift-s = "use_index +1 --skip-visible";
                Mod4-Shift-d = "attr clients.focus.floating toggle";

                Mod4-Up = "focus up";
                Mod4-Down = "focus down";
                Mod4-Right = "focus right";
                Mod4-Left = "focus left";

                Mod4-Shift-Up = "shift up";
                Mod4-Shift-Down = "shift down";
                Mod4-Shift-Right = "shift right";
                Mod4-Shift-Left = "shift left";

                Mod4-u = "split auto";
                Mod4-Mod1-Up = "chain , split top 0.5 , focus up";
                Mod4-Mod1-Down = "chain , split bottom 0.5 , focus down";
                Mod4-Mod1-Right = "chain , split right  0.5 , focus right";
                Mod4-Mod1-Left = "chain , split left 0.5 , focus left";
                Mod4-Shift-x = "remove";

                Mod4-Control-Up = "resize up +0.01";
                Mod4-Control-Down = "resize down +0.01";
                Mod4-Control-Right = "resize right +0.01";
                Mod4-Control-Left = "resize left +0.01";
            };
            mousebinds = {
                Mod4-Button1 = "move";
                Mod4-Button2 = "zoom";
                Mod4-Button3 = "resize";
            };
            rules = [
                "focus=on"
                "floatplacement=center"
                "class='firefox' tag=1"
                "class='Thunar' tag=3"
                "class='obsidian' tag=4"
                "class='thunderbird' tag=5"
                "class='TelegramDesktop' tag=6"
                "class='feh' floating=on floatplacement=center"
                "class='mpv' floating=on floatplacement=center"
                "windowtype~'_NET_WM_WINDOW_TYPE_(DIALOG|UTILITY|SPLASH)' pseudotile=on"
                "windowtype='_NET_WM_WINDOW_TYPE_DIALOG' focus=on floatcenter=on"
                "windowtype~'_NET_WM_WINDOW_TYPE_(NOTIFICATION|DOCK|DESKTOP)' manage=off"
            ];
            extraConfig = ''
                herbstclient rename default 1

                herbstclient keybind Mod4-1 use 1
                herbstclient keybind Mod4-2 use 2
                herbstclient keybind Mod4-3 use 3
                herbstclient keybind Mod4-4 use 4
                herbstclient keybind Mod4-5 use 5
                herbstclient keybind Mod4-6 use 6

                herbstclient keybind Mod4-Shift-1 move 1
                herbstclient keybind Mod4-Shift-2 move 2
                herbstclient keybind Mod4-Shift-3 move 3
                herbstclient keybind Mod4-Shift-4 move 4
                herbstclient keybind Mod4-Shift-5 move 5
                herbstclient keybind Mod4-Shift-6 move 6

                herbstclient attr theme.title_height 0
                herbstclient attr theme.padding_top 0
                herbstclient attr theme.urgent.color '${theme.base03}'

                herbstclient attr theme.active.inner_width 4
                herbstclient attr theme.active.outer_width 6
                herbstclient attr theme.active.inner_color '${theme.base09}'
                herbstclient attr theme.active.outer_color '${theme.base00}'

                herbstclient attr theme.normal.inner_width 4
                herbstclient attr theme.normal.outer_width 6
                herbstclient attr theme.normal.inner_color '${theme.base02}'
                herbstclient attr theme.normal.outer_color '${theme.base00}'

                herbstclient attr theme.floating.padding_top 20
                herbstclient attr theme.floating.border_width 10
                herbstclient attr theme.floating.color '${theme.base00}'

                herbstclient attr theme.background_color '${theme.base00}'

                herbstclient detect_monitors

                # Runs
                pkill polybar
                sleep 1;
                polybar main &
            '';
        };
    };
}
