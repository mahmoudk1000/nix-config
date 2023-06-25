{ config, pkgs, theme, ... }:

{
    programs.alacritty = {
        enable = true;
        settings = {
            env = {
                TERM = "xterm-256color";
            };
            window = {
                padding = {
                    x = 50;
                    y = 25;
                };
                dimensions = {
                    columns = 80;
                    lines = 20;
                };
            };
            font = {
                size = 9;
                normal = {
                    family = "IosevkaTerm Nerd Font";
                    style = "Regular";
                };
                bold = {
                    family = "IosevkaTerm Nerd Font";
                    style = "Bold";
                };
                italic = {
                    family = "IosevkaTerm Nerd Font";
                    style = "Italic";
                };
                bold_italic = {
                    family = "IosevkaTerm Nerd Font";
                    style = "Bold Italic";
                };
                offset = {
                    x = 0;
                    y = 1;
                };
                draw_bold_text_with_bright_colors = true;
            };
            scrolling = {
                history = 1000;
            };
            colors = {
                primary = {
                    background = "${theme.base00}";
                    foreground = "${theme.base01}";
                };
                cursor = {
                    text = "${theme.base09}";
                    cursor = "${theme.base01}";
                };
                selection = {
                    text = "${theme.base01}";
                    background = "${theme.base09}";
                };
                normal = {
                    black = "${theme.base02}";
                    red = "${theme.base03}";
                    green = "${theme.base04}";
                    yellow = "${theme.base05}";
                    blue = "${theme.base06}";
                    magenta = "${theme.base07}";
                    cyan = "${theme.base08}";
                    white = "${theme.base01}";
                };
                bright = {
                    black = "${theme.base09}";
                    red = "${theme.base0A}";
                    green = "${theme.base0B}";
                    yellow = "${theme.base0C}";
                    blue = "${theme.base0D}";
                    magenta = "${theme.base0E}";
                    cyan = "${theme.base0F}";
                    white = "${theme.base01}";
                };
            };
        };
    };
}
