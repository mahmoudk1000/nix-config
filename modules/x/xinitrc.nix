{ config
, ...
}:

{
  home.file.".xinitrc".text = ''
    if test -z "$DBUS_SESSION_BUS_ADDRESS"; then
      eval $(dbus-launch --exit-with-session --sh-syntax)
    fi
    systemctl --user import-environment DISPLAY XAUTHORITY

    if command -v dbus-update-activation-environment >/dev/null 2>&1; then
      dbus-update-activation-environment DISPLAY XAUTHORITY
    fi
    [ -r ~/.Xmodmap ] && xmodmap ~/.Xmodmap
    xsetroot -cursor_name left_ptr
    xrdb -load $HOME/.Xresources
    xset r rate 150 50

    # Session
    exec $HOME/.xsession
  '';
}
