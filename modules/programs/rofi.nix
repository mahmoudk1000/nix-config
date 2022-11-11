{ config, pkgs, theme, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
    programs.rofi = {
        enable = true;
        font = "Iosevka 9";
        terminal = "urxvt";
        plugins = with pkgs; [ rofi-calc rofi-emoji rofi-rbw ];
        extraConfig = {
            "modi" = "drun";
            "display-drun" = "";
            "drun-display-format" = "{icon} {name}";
            "show-icons" = true;
            "icon-theme" = "MoDelta";
        };
        theme = {
            "*" = {
                bg = mkLiteral theme.base00;
                fg = mkLiteral theme.base01;
                al = mkLiteral theme.base09;
                background-color = mkLiteral "@bg";
                text-color = mkLiteral "@fg";
            };
            window {
                border = mkLiteral "5";
                border-color = mkLiteral "@al";
                transparency = mkLiteral "real";
                orientation = mkLiteral "vertical";
                width = mkLiteral "33%";
            };
            mainbox {
                children = map mkLiteral [ inputbar, listview ];
                spacing = mkLiteral "5px";
                padding = mkLiteral "5px 5px 5px 5px";
            };
            prompt {
                font = mkLiteral "feather 12";
                background-color = mkLiteral "@al";
                vertical-align = mkLiteral "0.5";
                padding = mkLiteral "0.6em 0.75em";
                border-radius = mkLiteral "4px";
            };
            inputbar {
                orientation = mkLiteral "horizontal";
                children = map mkLiteral [ prompt, entry ];
            };
            listview {
                columns = mkLiteral "2";
                spacing = mkLiteral "1.5px";
                lines = mkLiteral "9";
            };
            entry {
                placeholder = mkLiteral "Search...";
                expand = mkLiteral "false";
                width = mkLiteral "25%";
                padding = mkLiteral "0.65em";
            };
            element {
                padding = mkLiteral "0.65em 0.75em";
            };
            element selected {
                border-radius = mkLiteral "4px";
                background-color = mkLiteral "@al";
            };
            element-text {
                background-color = mkLiteral "inherit";
                text-color = mkLiteral "inherit";
            };
            element-icon {
                background-color = mkLiteral "inherit";
                text-color = mkLiteral "inherit";
            };
            element-icon {
                size = mkLiteral "15px";
            };
        };
    };
}
