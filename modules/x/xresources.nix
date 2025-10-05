{ theme, mylib, ... }:

{
  xresources.extraConfig = ''
    *.background:   ${theme.base00}
    *.foreground:   ${theme.base01}
    *.cursorColor:  ${theme.base01}

    *.color0:       ${theme.base02}
    *.color8:       ${theme.base09}

    *.color1:       ${theme.base03}
    *.color9:       ${theme.base0A}

    *.color2:       ${theme.base04}
    *.color10:      ${theme.base0B}

    *.color3:       ${theme.base05}
    *.color11:      ${theme.base0C}

    *.color4:       ${theme.base06}
    *.color12:      ${theme.base0D}

    *.color5:       ${theme.base07}
    *.color13:      ${theme.base0E}

    *.color6:       ${theme.base08}
    *.color14:      ${theme.base0F}

    *.color7:       ${mylib.adjustBrightness theme.base01 0.4}
    *.color15:      ${mylib.adjustBrightness theme.base01 0.6}
  '';
}
