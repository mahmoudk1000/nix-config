{
  # X11 Windowing System (bare-metal laptop only, not used on WSL).
  services = {
    libinput = {
      enable = true;
      touchpad = {
        tapping = true;
        disableWhileTyping = true;
      };
    };
    xserver = {
      enable = true;
      xkb = {
        layout = "us,ara";
        variant = ",qwerty,";
        options = "caps:ctrl_modifier,grp:alt_space_toggle";
      };
      displayManager.startx.enable = true;
      updateDbusEnvironment = true;
    };
  };
}
