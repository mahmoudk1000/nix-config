{ theme, ... }:

{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    colorSchemes = {
      default = {
        background = "${theme.base00}";
        cursor_bg = "${theme.base00}";
        cursor_border = "${theme.base02}";
        cursor_fg = "${theme.base02}";
        foreground = "${theme.base01}";
        selection_bg = "${theme.base0A}";
        selection_fg = "${theme.base01}";
        ansi = [
          "${theme.base02}"
          "${theme.base03}"
          "${theme.base04}"
          "${theme.base05}"
          "${theme.base06}"
          "${theme.base07}"
          "${theme.base08}"
          "${theme.base01}"
        ];
        brights = [
          "${theme.base0A}"
          "${theme.base0B}"
          "${theme.base0C}"
          "${theme.base0C}"
          "${theme.base0D}"
          "${theme.base0E}"
          "${theme.base0F}"
          "${theme.base01}"
        ];
      };
    };
    extraConfig = ''
      local fonts = wezterm.font_with_fallback({
        {
          family = "IosevkaTerm Nerd Font",
          weight = "Regular",
          harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
        },
      })

      local keys = {
          { key = '?', mods = 'SHIFT|CTRL', action = wezterm.action.ShowLauncher },
          { key = 'q', mods = 'SUPER',      action = wezterm.action.QuitApplication },
          { key = 'k', mods = 'ALT|CTRL',   action = wezterm.action.DecreaseFontSize },
          { key = 'j', mods = 'ALT|CTRL',   action = wezterm.action.IncreaseFontSize },
          { key = '.', mods = 'ALT|CTRL',   action = wezterm.action.ResetFontSize },
          { key = 'k', mods = 'ALT|SHIFT',  action = wezterm.action.ScrollByPage(-0.5) },
          { key = 'j', mods = 'ALT|SHIFT',  action = wezterm.action.ScrollByPage(0.5) },
          { key = 'C', mods = 'CTRL',       action = wezterm.action.CopyTo("ClipboardAndPrimarySelection") },
          { key = 'V', mods = 'CTRL',       action = wezterm.action.PasteFrom("Clipboard") },
      }

      local launch_menu = {
        {
          label = "Open tmux",
          args = { "tmux" },
        },
        {
          label = "Open PowerShell",
          args = { "pwsh" },
        },
      }

      return {
        -- Default
        term                      = 'xterm-256color',
        check_for_updates         = false,
        window_close_confirmation = "NeverPrompt",

        -- Appearance
        color_scheme_dirs             = { '~/.config/wezterm/colors/default.toml' },
        color_scheme                  = 'default',
        force_reverse_video_cursor    = true,
        bold_brightens_ansi_colors    = 'No',
        hide_tab_bar_if_only_one_tab  = true,
        window_padding                = { left = 35, right = 35, top = 18, bottom = 18 },
        window_decorations            = 'RESIZE',
        default_cursor_style          = "BlinkingUnderline",
        enable_tab_bar                = false,
        use_fancy_tab_bar             = false,

        -- Menu
        launch_menu = launch_menu,

        -- Font
        font                      = fonts,
        unicode_version           = 16,
        custom_block_glyphs       = true,
        font_size                 = 9.0,
        command_palette_font_size = 9.0,
        line_height               = 1.0,
        freetype_load_flags       = "NO_HINTING",

        -- Keymaps
        disable_default_key_bindings = true,
        keys                         = keys,
      }
    '';
  };
}
