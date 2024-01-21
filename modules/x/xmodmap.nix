{ config
, pkgs
, ...
}:

{
  home.file.".Xmodmap".text = ''
    ! Keycode 94 is the key between Left-Shift and Z, which is < and >
    ! We are remapping it to function as a "Multi_key"
    keycode 94 = Multi_key less greater bar brokenbar bar brokenbar

    ! keyCode 66 is CapsLock by default, we are now remapping it
    ! to function as Escape (this is the part that makes it "Tap" to Escape)
    keycode 66 = Escape
  '';
}
