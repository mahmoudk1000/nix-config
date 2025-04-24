{
  # Set your time zone.
  time.timeZone = "Africa/Cairo";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_TIME = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
    };
  };
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  # X11 Windowing System.
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
        variant = "qwerty,,";
        options = "caps:ctrl_modifier,grp:alt_space_toggle";
      };
      displayManager.startx.enable = true;
      updateDbusEnvironment = true;
    };
  };
}
