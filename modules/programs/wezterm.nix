{ theme
, ...
}:

{
  programs.wezterm = {
    enable = false;
    colorSchemes = {
      dunkelblau = {
        background = "${theme.base00}";
        cursor_bg = "${theme.base00}";
        cursor_border = "${theme.base02}";
        cursor_fg = "${theme.base02}";
        foreground = "${theme.base01}";
        selection_bg = "${theme.base09}";
        selection_fg = "${theme.base01}";
        ansi = [
          "${theme.base02}" "${theme.base03}" "${theme.base04}" "${theme.base05}"
            "${theme.base06}" "${theme.base07}" "${theme.base08}" "${theme.base01}"
        ];
        brights = [
          "${theme.base0A}" "${theme.base0B}" "${theme.base0C}" "${theme.base0C}"
            "${theme.base0D}" "${theme.base0E}" "${theme.base0F}" "${theme.base01}"
        ];
      };
    };
    extraConfig = ''
      local wezterm = require "wezterm"
      local font_name = "IosevkaTerm Nerd Font"
      return {
        -- OpenGL for GPU acceleration, Software for CPU
        front_end = "OpenGL",

        -- Color Scheme
        color_scheme_dirs = { '~/.config/wezterm/colors/dunkelblau.toml' },

        -- No updates, bleeding edge only
        check_for_updates = false,

        -- Font Stuff
        font = wezterm.font_with_fallback(font_name),
        font_rules = {
          { 
            italic = true,
            font = wezterm.font_with_fallback(family = font_name, italic = true)
          },
          {
            intensity = "Bold",
            font = wezterm.font_with_fallback(family = font_name, bold = true)
          }
        },
        font_size = 9.0,
        line_height = 1.0,

        -- Cursor style
        default_cursor_style = "SteadyUnderline",

        -- Keys
        disable_default_key_bindings = true,

        keys = {
          {
            mods = "CTRL|SHIFT",
            key = [[\]],
            action = wezterm.action { SplitHorizontal = {domain = "CurrentPaneDomain"} }
          },
          {
            mods = "CTRL",
            key = [[\]],
            action = wezterm.action { SplitVertical = {domain = "CurrentPaneDomain"} }
          }, 
          -- browser-like bindings for tabbing
          {
            key = "t",
            mods = "CTRL",
            action = wezterm.action { SpawnTab = "CurrentPaneDomain" }
          },
          {
            key = "w",
            mods = "CTRL",
            action = wezterm.action { CloseCurrentTab = {confirm = false} }
          },
          {
            mods = "CTRL",
            key = "Tab",
            action = wezterm.action { ActivateTabRelative = 1 }
          },
          {
            mods = "CTRL|SHIFT",
            key = "Tab",
            action = wezterm.action { ActivateTabRelative = -1 }
          }, 
          -- standard copy/paste bindings
          { 
            key = "x",
            mods = "CTRL",
            action = wezterm.action { "ActivateCopyMode" }
          },
          {
            key = "v",
            mods = "CTRL|SHIFT",
            action = wezterm.action { PasteFrom = "Clipboard" }
          },
          {
            key = "c",
            mods = "CTRL|SHIFT",
            action = wezterm.action { CopyTo = "ClipboardAndPrimarySelection" }
          }
        },

        -- Pretty Colors
        bold_brightens_ansi_colors = false,

        -- Get rid of close prompt
        window_close_confirmation = "NeverPrompt",

        -- Padding
        window_padding = { left = '40pt', right = '40pt', top = '40pt', bottom = '40pt' },

        -- No opacity
        inactive_pane_hsb = { saturation = 1.0, brightness = 1.0 },

        window_frame = { active_titlebar_bg = "${theme.base00}" },

        enable_tab_bar = false,
        use_fancy_tab_bar = false,
        hide_tab_bar_if_only_one_tab = true,
        show_tab_index_in_tab_bar = false
      }
    '';
  };
}
