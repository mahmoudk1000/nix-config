{
  theme,
  pkgs,
  inputs,
  font,
  ...
}:

{
  programs.wezterm = {
    enable = true;
    package = inputs.wezterm.packages.${pkgs.system}.default;
    enableZshIntegration = true;
    colorSchemes = {
      default = {
        background = "${theme.base00}";
        cursor_bg = "${theme.base05}";
        cursor_border = "${theme.base05}";
        cursor_fg = "${theme.base00}";
        foreground = "${theme.base05}";
        selection_bg = "${theme.base02}";
        selection_fg = "${theme.base05}";
        ansi = [
          "${theme.base00}"
          "${theme.base08}"
          "${theme.base0B}"
          "${theme.base0A}"
          "${theme.base0D}"
          "${theme.base0E}"
          "${theme.base0C}"
          "${theme.base05}"
        ];
        brights = [
          "${theme.base03}"
          "${theme.base08}"
          "${theme.base0B}"
          "${theme.base0A}"
          "${theme.base0D}"
          "${theme.base0E}"
          "${theme.base0C}"
          "${theme.base07}"
        ];
      };
    };
    extraConfig = ''
      local fonts = wezterm.font_with_fallback({
        {
          family = "${font.nameTerm}",
          weight = "Regular",
          harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
        },
      })

      local keys = {
          { key = "?", mods = "SHIFT|CTRL", action = wezterm.action.ShowLauncher },
          { key = "q", mods = "SUPER",      action = wezterm.action.QuitApplication },
          { key = "j", mods = "ALT|CTRL",   action = wezterm.action.DecreaseFontSize },
          { key = "k", mods = "ALT|CTRL",   action = wezterm.action.IncreaseFontSize },
          { key = ".", mods = "ALT|CTRL",   action = wezterm.action.ResetFontSize },
          { key = "k", mods = "ALT|SHIFT",  action = wezterm.action.ScrollByPage(-0.5) },
          { key = "j", mods = "ALT|SHIFT",  action = wezterm.action.ScrollByPage(0.5) },
          { key = "C", mods = "CTRL",       action = wezterm.action.CopyTo("ClipboardAndPrimarySelection") },
          { key = "V", mods = "CTRL",       action = wezterm.action.PasteFrom("Clipboard") },
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
        term                      = "xterm-256color",
        audible_bell              = "Disabled",
        check_for_updates         = false,
        window_close_confirmation = "NeverPrompt",
        default_prog              = { "/run/current-system/sw/bin/zsh" },

        -- Appearance
        color_scheme_dirs             = { "~/.config/wezterm/colors/default.toml" },
        color_scheme                  = "default",
        force_reverse_video_cursor    = true,
        bold_brightens_ansi_colors    = "No",
        hide_tab_bar_if_only_one_tab  = true,
        window_padding                = { left = 35, right = 35, top = 18, bottom = 18 },
        window_decorations            = "RESIZE",
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
