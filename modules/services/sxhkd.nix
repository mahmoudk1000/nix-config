{ config, pkgs, ... }:

{
    services.sxhkd = {
        enable = true;
        keybindings = {
            # "super + Return" = "urxvt";
            # "super + d" = "rofi -show drun";
            "super + b" = "~/.bin/rofi-bluetooth";
            "super + p" = "~/.bin/rofi-poww";
            # "super + l" = "betterlockscreen -l";

            "XF86MonBrightness{Up,Down}" = "light -{A,U} 10";
            "XF86Audio{Raise,Lower}Volume" = "pamixer {-i 5,-d 5}";
            "XF86AudioMute" = "pamixer --toggle-mute";
            "XF86Audio{Next,Prev,Play}" = "playerctl {next,previous,play-pause}";
            "ctrl + XF86Audio{Next,Prev,Play}" = "mpc {next,prev,toggle}";
            "{_,shift,alt} + Print" = "flameshot {full,gui,full -d 5000}";

            # "super + {a, f, g, m, o, s, t, w}" = "{anki, thunar, teams, thunderbird, obsidian, spotify, telegram-desktop, firefox}";
            # "super + {_,shift +}q" = "bspc node -{c,k}";
            # "super + n" = "bspc desktop -l next";
            # "super + shift + {d, w, t, f}" = "bspc node -t {floating, pseudo_tiled, tiled, fullscreen}";
            # "super + {_,shift +}{Left,Right,Up,Down}" = "bspc node -{f,s} {west,east,north,south}";
            # "super + {_,shift + }Tab" = "bspc node -f {next, prev}.local.!hidden.window";
            # "super + shift + {a,s}" = "bspc desktop -f {prev,next}";
            # "super + {_,shift +}{1-9}" = "bspc {desktop -f, node -d} '{1-9}'";
            # "super + ctrl + {Left,Down,Up,Right}" = "bspc node -z {left -20 0,bottom 0 20,top 0 -20,right 20 0}";
            # "super + alt + {Left,Down,Up,Right}" = "bspc node -z {right -20 0,top 0 20,bottom 0 -20,left 20 0}";
            # "super + ctrl + shift + {Left,Down,Up,Right}" = "bspc node -v {-100 0,0 100,0 -100,100 0}";
            # "super + ctrl + s" = "bspc node --flag sticky";
            # "super + alt + {q,r}" = "bspc {quit,wm -r}";
        };
    };
}
