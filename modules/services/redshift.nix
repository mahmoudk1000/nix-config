{
  services.redshift = {
    enable = true;
    tray = false;
    provider = "manual";
    latitude = 31.2156;
    longitude = 29.9553;
    temperature = {
      day = 6000;
      night = 3500;
    };
  };
  settings = {
    redshift = {
      gamma = 0.8;
      gamma-day = 0.9;
      gamma-night = 0.8;
      adjustment-method = "randr";
    };
    randr = {
      screen = 0;
    };
  };
}
