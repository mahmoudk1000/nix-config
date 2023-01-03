{ config, pkgs, theme, ... }:

let
    borders = pkgs.writeScriptBin "borders" ''
        outer="${theme.base00}" # outer
        innr1="${theme.base02}" # focused
        innr2="${theme.base09}" # normal

        trap 'bspc config border_width 0; kill -9 -$$' INT TERM

        targets() {
            case $1 in
                focused) bspc query -N -n .local.focused.\!fullscreen ;;
                normal) bspc query -N -n .\!focused.\!fullscreen ;;
            esac
        }

        bspc config border_width 10

        draw() {
            chwb2 -I "$inner" -O "$outer" -i "3" -o "7" $*
        }

        {
            echo
            bspc subscribe node_geometry node_focus
        } |
            while read -r _; do
                [ "$v" ] || v='abcdefg'
                inner=$innr1 draw $(targets focused)
                inner=$innr2 draw $(targets normal)
            done >/dev/null 2>&1
    '';
in
{
    xsession = {
        windowManager = {
            bspwm = {
                alwaysResetDesktops = true;
                startupPrograms = [
                    "xset r rate 200 30"
                    "xsetroot -cursor_name left_ptr"
                    "$HOME/.config/conky/Moo/start.sh"
                ];
                monitors = {
                    eDP1 = [ "1" "2" "3" "4" "5" "6" "7" "8" "9" ];
                };
                rules = {
                    "feh" = {
                        state = "floating";
                    };
                    "*:*:Picture-in-Picture" = {
                        state = "floating";
                        sticky = true;
                    };
                    "mpv" = {
                        state = "floating";
                        follow = true;
                    };
                    "firefox" = {
                        desktop = "^1";
                    };
                    "Thunar" = {
                        desktop = "^4";
                        follow = true;
                    };
                    "obsidian" = {
                        desktop = "^5";
                    };
                    "thunderbird" = {
                        desktop = "^6";
                    };
                    "TelegramDesktop" = {
                        desktop = "^7";
                        follow = true;
                    };
                    "Spotify" = {
                        desktop = "^8";
                    };
                };
                settings = {
                    window_gap = 10;
                    border_width = 10;
                    split_ratio = 0.50;
                    top_padding = 0;
                    right_padding = 0;
                    bottom_padding = 60;
                    left_padding = 0;
                    single_monocle = true;
                    gapless_monocle = false;
                    borderless_monocle = false;
                    pointer_modifier = "mod4";
                    click_to_focus = true;
                    focus_follows_pointer = true;
                    pointer_action1 = "move";
                    pointer_action2 = "resize_side";
                    pointer_action3 = "resize_corner";
                    normal_border_color = theme.base00;
                    active_border_color = theme.base09;
                    focused_border_color = theme.base02;
                };
                extraConfig = ''
                    ${borders}
                    pkill polybar
                    sleep 1;
                    polybar ein &
                    polybar zwei &
                    polybar drei &
                '';
            };
        };
    };

    home.packages = with pkgs; [
        wmutils-opt
    ];
}
