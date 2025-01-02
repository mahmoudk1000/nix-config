{
  services.udiskie = {
    enable = true;
    automount = true;
    notify = true;
    settings = {
      udisks_version = 2;
      tray = true;
    };
  };
}
