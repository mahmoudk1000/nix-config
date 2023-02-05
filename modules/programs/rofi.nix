{ config, pkgs, theme, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
    programs.rofi = {
        enable = true;
        font = "Iosevka 9";
        terminal = "st";
        extraConfig = {
            "modi" = "drun";
            "display-drun" = "";
            "drun-display-format" = "{icon} {name}";
            "show-icons" = true;
            "icon-theme" = "MoDelta";
        };
        theme = {
            "*" = {
                bg = mkLiteral theme.base00;
                fg = mkLiteral theme.base01;
                al = mkLiteral theme.base02;
                background-color = mkLiteral "@bg";
                text-color = mkLiteral "@fg";
            };
            window = {
                border = mkLiteral "5";
                border-color = mkLiteral "@al";
                transparency = mkLiteral ''"real"'';
                orientation = mkLiteral "vertical";
                width = mkLiteral "33%";
            };
            mainbox = {
                children = map mkLiteral [ "inputbar"  "listview" ];
                spacing = mkLiteral "5px";
                padding = mkLiteral "5px 5px 5px 5px";
            };
            prompt = {
                font = mkLiteral ''"IosevkaTerm Nerd Font 10"'';
                background-color = mkLiteral "@al";
                vertical-align = mkLiteral "0.5";
                padding = mkLiteral "0.6em 1.1em 0.6em 0.75em";
                border-radius = mkLiteral "4px";
            };
            inputbar = {
                orientation = mkLiteral "horizontal";
                children = map mkLiteral [ "prompt"  "entry" ];
            };
            listview = {
                columns = mkLiteral "2";
                spacing = mkLiteral "1.5px";
                lines = mkLiteral "9";
            };
            entry = {
                placeholder = mkLiteral ''"Search..."'';
                expand = mkLiteral "false";
                width = mkLiteral "25%";
                padding = mkLiteral "0.65em";
            };
            element = {
                padding = mkLiteral "0.65em 0.75em";
            };
            "element selected" = {
                border-radius = mkLiteral "4px";
                background-color = mkLiteral "@al";
            };
            "element-text, element-icon" = {
                background-color = mkLiteral "inherit";
                text-color = mkLiteral "inherit";
            };
            element-icon = {
                size = mkLiteral "15px";
            };
        };
    };

    home.file.".config/rofi/poww.rasi".text = ''
        configuration {
	    font:   "Material Design Icons Desktop 20";
	    disable-history:    false;
	    sidebar-mode:   false;
	    show-icons:    false;
        }
        @theme "/dev/null"
        * {
            bg:	    ${theme.base00};
            lg:	    ${theme.base02};
            fg:	    ${theme.base01};
            se:     ${theme.base06};
            background-color:   @bg;
            text-color:     @fg;
        }
        window {
            transparency:   "real";
            border-radius:  4px;
            location:   center;
            width:      400px;
        }
        listview {
            columns:	5;
            lines:	1;
            spacing:    12px;
            cycle:      true;
            dynamic:    true;
            layout:     vertical;
        }
        mainbox {
            children:	[ listview ];
            spacing:	20px;
            margin:	20px;
        }
        element {
            background-color:   @lg;
            border-radius:      4px;
        }
        element-text {
            background-color:   inherit;
            text-color:       	inherit;
            expand:             true;
            horizontal-align:   0.5;
            vertical-align:     0.5;
            margin:             15px 15px 15px 15px;
        }
        element selected {
            text-color: 	@bg;
            background-color:   @se;
            border-radius:      4px;
        }
    '';
}
