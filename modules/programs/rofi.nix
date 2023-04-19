{ config, pkgs, theme, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
    programs.rofi = {
        enable = true;
        font = "IosevkaTerm Nerd Font 9";
        terminal = "st";
        extraConfig = {
            # "modi" = "drun,run,filebrowser,window";
            "modi" = "drun";
            "display-drun" = "";
            "display-run" = "";
            "display-filebrowser" = "";
            "display-window" = "";
            "drun-display-format" = "{icon} {name}";
            "window-format" = " {w} · {c} · {t}";
            "show-icons" = true;
            "icon-theme" = "MoDelta";
        };
        theme = {
            "*" = {
                bg = mkLiteral theme.base00;
                fg = mkLiteral theme.base01;
                al = mkLiteral theme.base02;
                ac = mkLiteral theme.base06;
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
                # children = map mkLiteral [ "inputbar" "mode-switcher" "listview" ];
                children = map mkLiteral [ "inputbar" "listview" ];
                spacing = mkLiteral "5px";
                padding = mkLiteral "5px 5px 5px 5px";
            };
            prompt = {
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
            mode-switcher = {
                enabled = mkLiteral "true";
                expand = mkLiteral "false";
                spacing = mkLiteral "10px";
                margin = mkLiteral "0px";
                padding = mkLiteral "0px";
                border = mkLiteral "0px solid";
                border-radius = mkLiteral "0px";
                border-color = mkLiteral "@fg";
                background-color = mkLiteral "transparent";
                text-color = mkLiteral "@fg";
            };
            button = {
                padding = mkLiteral "12px";
                border = mkLiteral "0px solid";
                border-radius = mkLiteral "4px";
                border-color = mkLiteral "@al";
                background-color = mkLiteral "@bg";
                text-color = mkLiteral "inherit";
                cursor = mkLiteral "pointer";
            };
            "button selected" = {
                background-color = mkLiteral "@ac";
                text-color = mkLiteral "@bg";
            };
            num-filtered-rows = {
                enabled = mkLiteral "true";
                expand = mkLiteral "false";
                background-color = mkLiteral "inherit";
                text-color = mkLiteral "inherit";
            };
            textbox-num-sep = {
                enabled = mkLiteral "true";
                expand = mkLiteral "false";
                str = mkLiteral ''"/"'';
                background-color = mkLiteral "inherit";
                text-color = mkLiteral "inherit";
            };
            num-rows = {
                enabled = mkLiteral "true";
                expand = mkLiteral "false";
                background-color = mkLiteral "inherit";
                text-color = mkLiteral "inherit";
            };
            case-indicator = {
                enabled = mkLiteral "true";
                background-color = mkLiteral "inherit";
                text-color = mkLiteral "inherit";
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
