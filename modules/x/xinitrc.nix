{ config, pkgs, ... }:

{
    home.file.".xinitrc".text = ''
        [ -r ~/.Xmodmap ] && xmodmap ~/.Xmodmap
        xrdb -load $HOME/.Xresources
        $HOME/.fehbg

        # Session
        exec $HOME/.xsession
    '';
}
