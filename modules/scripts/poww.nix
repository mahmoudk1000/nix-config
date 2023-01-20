{ pkgs, ...  }:

let
    name = "poww";
in
pkgs.writeScriptBin name
    ''
        option0=
        option1=
        option2=
        option3=
        option4=

        rofi_command="rofi -theme ~/.config/rofi/poww.rasi"

        options="$option0
        $option1
        $option2
        $option3
        $option4"

        chosen="$(echo "$options" | $rofi_command -dmenu -selected-row 2)"

        case $chosen in
            $option0)
                betterlockscreen --lock 
            ;;
            $option1)
                systemctl reboot
            ;;
            $option2)
                systemctl poweroff
            ;;
                $option3)
                killall -u $USER
            ;;
            $option4)
                systemctl suspend
            ;;
        esac
    ''
