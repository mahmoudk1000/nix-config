{ config, pkgs, ... }:

{
    home.file.".xinitrc".text = ''
        [ -r ~/.Xmodmap ] && xmodmap ~/.Xmodmap
        xrdb -load $HOME/.Xresources
        xset r rate 150 50
        $HOME/.fehbg

        # Session
        exec $HOME/.xsession
    '';
}
