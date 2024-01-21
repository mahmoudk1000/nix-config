{ config
, theme
, ...
}:

{
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        savePath = "${config.home.homeDirectory}/scrots";
        filenamePattern = ''%F_%H-%M'';
        savePathFixed = true;
        saveAsFileExtension = ".png";
        uiColor = theme.base06;
        showHelp = "false";
        disabledTrayIcon = "true";
      };
    };
  };
}
