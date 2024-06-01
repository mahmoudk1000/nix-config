{ theme, ... }:

{
  xresources.extraConfig = ''
    *.foreground:   ${theme.base01}
    *.background:   ${theme.base00}
    *.cursorColor:  ${theme.base01}

    *.color0:       ${theme.base02}
    *.color8:       ${theme.base0A}

    *.color1:       ${theme.base03}
    *.color9:       ${theme.base0B}

    *.color2:       ${theme.base04}
    *.color10:      ${theme.base0C}

    *.color3:       ${theme.base05}
    *.color11:      ${theme.base0D}

    *.color4:       ${theme.base06}
    *.color12:      ${theme.base0E}

    *.color5:       ${theme.base07}
    *.color13:      ${theme.base0F}

    *.color6:       ${theme.base08}
    *.color14:      ${theme.base0G}

    *.color7:       ${theme.base09}
    *.color15:      ${theme.base0H}
  '';
}
