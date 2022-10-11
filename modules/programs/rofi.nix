{ config, pkgs, ... }:

{
    programs.rofi = {
        enable = true;
        font = "Iosevka 9";
        terminal = "urxvt";
        plugins = with pkgs; [ rofi-calc rofi-emoji rofi-rbw ];
        extraConfig = {
            "modi" = "drun";
            "display-drun" = "";
            "drun-display-format" = "{icon} {name}";
            "show-icons" = true;
            "icon-theme" = "MoDelta";
        };
        theme = ./rofis.rasi;
    };
}
