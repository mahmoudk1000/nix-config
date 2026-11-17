{
  lib,
  theme,
  font,
  fontFallback ? [ ],
  ...
}:

let
  fallbacks = lib.optionalString (fontFallback != [ ]) (
    "\n" + lib.concatMapStringsSep "\n" (f: "  { family = \"${f}\" },") fontFallback
  );
in
{
  font = ''
    local font = wezterm.font_with_fallback({
      {
        family = "${font.nameTerm}",
        weight = "Regular",
        harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
      },${fallbacks}
    })
  '';

  colors = ''
    local colors = {
      background = "${theme.base00}",
      foreground = "${theme.base05}",
      selection  = "${theme.base02}",
      ansi = {
        "${theme.base00}",
        "${theme.base08}",
        "${theme.base0B}",
        "${theme.base0A}",
        "${theme.base0D}",
        "${theme.base0E}",
        "${theme.base0C}",
        "${theme.base05}",
      },
      brights = {
        "${theme.base03}",
        "${theme.base08}",
        "${theme.base0B}",
        "${theme.base0A}",
        "${theme.base0D}",
        "${theme.base0E}",
        "${theme.base0C}",
        "${theme.base07}",
      },
    }
  '';

  scheme = ''
    local color_scheme = {
      background    = colors.background,
      foreground    = colors.foreground,
      selection_bg  = colors.selection,
      selection_fg  = colors.foreground,
      cursor_bg     = colors.foreground,
      cursor_border = colors.foreground,
      cursor_fg     = colors.background,
      ansi          = colors.ansi,
      brights       = colors.brights,
    }
  '';
}
