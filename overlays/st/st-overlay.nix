self: super:

{
  st =
    with super;
    st.overrideAttrs (oldAttrs: rec {
      src = self.fetchFromGitHub {
        owner = "bakkeby";
        repo = "st-flexipatch";
        rev = "dd8675943d2e6e1eff15d3ac3aac6e5e5643582b";
        sha256 = "sha256-gtT+ShmkD/AEip3JtN5QLQHttgEh11VtaEk8gYhQVDw=";
      };

      configFile = writeText "config.def.h" (builtins.readFile ./config.h);

      buildInputs =
        oldAttrs.buildInputs
        ++ (with super; [
          harfbuzz
          gd
          glib
          xorg.libXcursor
        ]);

      postPatch =
        oldAttrs.postPatch
        + ''
          cp ${configFile} config.def.h

          substituteInPlace config.mk \
            --replace "#XCURSOR = `$(PKG_CONFIG) --libs xcursor`" "XCURSOR = `$(PKG_CONFIG) --libs xcursor`" \
            --replace "#LIGATURES_C = hb.c" "LIGATURES_C = hb.c" \
            --replace "#LIGATURES_H = hb.h" "LIGATURES_H = hb.h" \
            --replace "#LIGATURES_INC = `$(PKG_CONFIG) --cflags harfbuzz`" "LIGATURES_INC = `$(PKG_CONFIG) --cflags harfbuzz`" \
            --replace "#LIGATURES_LIBS = `$(PKG_CONFIG) --libs harfbuzz`" "LIGATURES_LIBS = `$(PKG_CONFIG) --libs harfbuzz`" \
            --replace "#NETWMICON_LIBS = `$(PKG_CONFIG) --libs gdlib`" "NETWMICON_LIBS = `$(PKG_CONFIG) --libs gdlib`"

          substituteInPlace patches.def.h \
            --replace "#define BLINKING_CURSOR_PATCH 0" "#define BLINKING_CURSOR_PATCH 1"  \
            --replace "#define ANYSIZE_PATCH 0" "#define ANYSIZE_PATCH 1"  \
            --replace "#define BOLD_IS_NOT_BRIGHT_PATCH 0" "#define BOLD_IS_NOT_BRIGHT_PATCH 1"  \
            --replace "#define BOXDRAW_PATCH 0" "#define BOXDRAW_PATCH 1"  \
            --replace "#define CLIPBOARD_PATCH 0" "#define CLIPBOARD_PATCH 1"  \
            --replace "#define COLUMNS_PATCH 0" "#define COLUMNS_PATCH 1"  \
            --replace "#define CSI_22_23_PATCH 0" "#define CSI_22_23_PATCH 1"  \
            --replace "#define DYNAMIC_CURSOR_COLOR_PATCH 0" "#define DYNAMIC_CURSOR_COLOR_PATCH 1"  \
            --replace "#define FONT2_PATCH 0" "#define FONT2_PATCH 1"  \
            --replace "#define HIDECURSOR_PATCH 0" "#define HIDECURSOR_PATCH 1"  \
            --replace "#define ISO14755_PATCH 0" "#define ISO14755_PATCH 1"  \
            --replace "#define LIGATURES_PATCH 0" "#define LIGATURES_PATCH 1"  \
            --replace "#define NETWMICON_PATCH 0" "#define NETWMICON_PATCH 1"  \
            --replace "#define NO_WINDOW_DECORATIONS_PATCH 0" "#define NO_WINDOW_DECORATIONS_PATCH 1"  \
            --replace "#define REFLOW_PATCH 0" "#define REFLOW_PATCH 1"  \
            --replace "#define NETWMICON_FF_PATCH 0" "#define NETWMICON_FF_PATCH 1"  \
            --replace "#define SCROLLBACK_PATCH 0" "#define SCROLLBACK_PATCH 1"  \
            --replace "#define SCROLLBACK_MOUSE_PATCH 0" "#define SCROLLBACK_MOUSE_PATCH 1"  \
            --replace "#define SELECTION_COLORS_PATCH 0" "#define SELECTION_COLORS_PATCH 1"  \
            --replace "#define SYNC_PATCH 0" "#define SYNC_PATCH 1"  \
            --replace "#define THEMED_CURSOR_PATCH 0"  "#define THEMED_CURSOR_PATCH 1"  \
            --replace "#define WIDE_GLYPHS_PATCH 0" "#define WIDE_GLYPHS_PATCH 1"  \
            --replace "#define WIDE_GLYPH_SPACING_PATCH 0" "#define WIDE_GLYPH_SPACING_PATCH 1"  \
            --replace "#define XRESOURCES_PATCH 0" "#define XRESOURCES_PATCH 1"
        '';
    });
}
