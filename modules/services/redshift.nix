{
  services.redshift = {
    enable = true;
    temperature = {
      day = 5500;
      night = 4500;
    };
    tray = false;
    provider = "manual";
    latitude = "31";
    longitude = "29";
  };
}
