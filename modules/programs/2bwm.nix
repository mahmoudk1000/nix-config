{
  config,
  lib,
  theme,
  ...
}:

{
  xresources.properties = lib.mkIf (config.xsession.windowManager.command == "2bwm") {
    "twobwm.border_width" = 10;
    "twobwm.outer_border" = 6;
    "twobwm.focus_color" = theme.base0D;
    "twobwm.unfocus_color" = theme.base02;
    "twobwm.fixed_color" = theme.base0C;
    "twobwm.unkill_color" = theme.base08;
    "twobwm.outer_border_color" = theme.base00;
    "twobwm.fixed_unkill_color" = theme.base0E;
    "twobwm.inverted_colors" = false;
    "twobwm.enable_compton" = true;
  };
}
