{ pkgs, user, ... }:

{
    services.flameshot = {
        enable = true;
        settings = {
            General = {
                savePath = "/home/mahmoud/scrots";
                saveAsFileExtension = ".png";
                uiColor = "#bd93f9";
                showHelp = "false";
                disabledTrayIcon = "true";
            };
        };
    };
}
