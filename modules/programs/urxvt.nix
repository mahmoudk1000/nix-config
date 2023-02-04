{ config, pkgs, theme, ... }:

{
    programs.urxvt = {
        enable = true;
        package = pkgs.rxvt-unicode;
        iso14755 = true;
        fonts = [ "xft:IosevkaTerm Nerd Font:pixelsize=12:antialias=true:autohint=true" ];
        keybindings = {
            "Shift-Up" = ''command:\033]720;1\007'';
            "Shift-Down" = ''command:\033]721;1\007'';
            "C-equal" = "perl:font-size:reset";
            "C-plus" = "perl:font-size:increase";
            "C-minus" = "perl:font-size:decrease";
            "C-Up" = ''\033[1;5A'';
            "C-Down" = ''\033[1;5B'';
            "C-Left" = ''\033[1;5D'';
            "C-Right" = ''\033[1;5C'';
            "M-c" = "eval:selection_to_clipboard";
            "M-v" = "eval:paste_clipboard";
        };
        extraConfig = {
            "background" = "[100]${theme.base00}";
            "letterSpace" = 0;
            "lineSpace" = 0;
            "geometry" = "70x35";
            "internalBorder" = 25;
            "cursorBlink" = true;
            "cursorUnderline" = false;
            "thickness" = 5;
            "titleBar" = false;
            "intensityStyles" = false;

            "perl-ext-common" = "default,matcher,font-size,clipboard";
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
