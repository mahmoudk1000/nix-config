{ theme
, ...
}:

{
  xresources.properties = {
    "twobwm.border_width" = 10;
    "twobwm.outer_border" = 6;
    "twobwm.focus_color" = theme.base09;
    "twobwm.unfocus_color" = theme.base02;
    "twobwm.fixed_color" = theme.base06;
    "twobwm.unkill_color" = theme.base03;
    "twobwm.outer_border_color" = theme.base00;
    "twobwm.fixed_unkill_color" = theme.base07;
    "twobwm.inverted_colors" = false;
    "twobwm.enable_compton" = true;
  };
}
