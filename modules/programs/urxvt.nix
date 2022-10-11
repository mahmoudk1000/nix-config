{ config, pkgs, theme, ... }:

{
    programs.urxvt = {
        enable = true;
        iso14755 = true;
        fonts = [
            "xft:Iosevka Term Curly Slab:style=Regular:pixelsize=12:antialias=true:autohint=true"
            "xft:Iosevka Term Curly Slab:style=Bold Italic:pixelsize=12:antialias=true:autohint=true"
        ];
        keybindings = {
            #"Shift-Up" = "command:\033]720;1\007";
            "Shift-Up" = ''command:\033[1;2A'';
            #"Shift-Down" = "command:\033]721;1\007";
            "Shift-Down" = ''command:\033[1;2B'';
            "C-Up" = "perl:font-size:increase";
            "C-Down" = "perl:font-size:decrease";
            "C-equal" = "perl:font-size:reset";
            "C-Left" = ''\033[1;5D'';
            "C-Right" = ''\033[1;5C'';
            "M-c" = "eval:selection_to_clipboard";
            "M-v" = "eval:paste_clipboard";
        };
        extraConfig = {
            "letterSpace" = 0;
            "lineSpace" = 0;
            "geometry" = "92x24";
            "internalBorder" = 25;
            "cursorBlink" = true;
            "cursorUnderline" = false;

            "perl-ext-common" = "default,matcher,font-size,clipboard,url-select";
            "url-launcher" = "firefox";
            "matcher.button" = 1;
        };
        scroll = {
            bar.enable = false;
            keepPosition = true;
            lines = 10000;
            scrollOnKeystroke = true;
            scrollOnOutput = false;
        };
    };
}
