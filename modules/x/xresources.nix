{ theme, ... }:

{
  xresources.extraConfig = ''
    *.background:   ${theme.base00}
    *.foreground:   ${theme.base05}
    *.cursorColor:  ${theme.base05}

    *.color0:       ${theme.base00}
    *.color1:       ${theme.base08}
    *.color2:       ${theme.base0B}
    *.color3:       ${theme.base0A}
    *.color4:       ${theme.base0D}
    *.color5:       ${theme.base0E}
    *.color6:       ${theme.base0C}
    *.color7:       ${theme.base05}

    *.color8:       ${theme.base03}
    *.color9:       ${theme.base08}
    *.color10:      ${theme.base0B}
    *.color11:      ${theme.base0A}
    *.color12:      ${theme.base0D}
    *.color13:      ${theme.base0E}
    *.color14:      ${theme.base0C}
    *.color15:      ${theme.base07}
  '';
}
