{
  lib,
  theme,
  font,
  host ? {
    isWSL = false;
  },
  ...
}:

let
  inherit (host) isWSL;
  shared = import ./shared.nix { inherit lib theme font; };

  wslMenu = lib.optionalString isWSL ''
    { label = "Open PowerShell", args = { "pwsh.exe" } },
    { label = "Open Explorer", args = { "explorer.exe" } },
    { label = "Open cmd", args = { "cmd.exe" } },
  '';
in
''
  ${shared.font}
  ${shared.colors}
  ${shared.scheme}

  local keys = {
    { key = "?", mods = "SHIFT|CTRL", action = wezterm.action.ShowLauncher },
    { key = "q", mods = "SUPER", action = wezterm.action.QuitApplication },
    { key = "j", mods = "ALT|CTRL", action = wezterm.action.DecreaseFontSize },
    { key = "k", mods = "ALT|CTRL", action = wezterm.action.IncreaseFontSize },
    { key = ".", mods = "ALT|CTRL", action = wezterm.action.ResetFontSize },
    { key = "k", mods = "ALT|SHIFT", action = wezterm.action.ScrollByPage(-0.5) },
    { key = "j", mods = "ALT|SHIFT", action = wezterm.action.ScrollByPage(0.5) },
    { key = "C", mods = "CTRL", action = wezterm.action.CopyTo("ClipboardAndPrimarySelection") },
    { key = "V", mods = "CTRL", action = wezterm.action.PasteFrom("Clipboard") },
  }

  local launch_menu = {
    { label = "Open tmux", args = { "tmux" } },
    ${wslMenu}
  }

  return {
    -- General
    term                      = "xterm-256color",
    default_prog              = { "/run/current-system/sw/bin/zsh" },
    audible_bell              = "Disabled",
    check_for_updates         = false,
    window_close_confirmation = "NeverPrompt",

    -- Appearance
    color_schemes              = { default = color_scheme },
    color_scheme               = "default",
    font                       = font,
    font_size                  = 9.0,
    command_palette_font_size  = 9.0,
    line_height                = 1.0,
    unicode_version            = 16,
    custom_block_glyphs        = true,
    freetype_load_flags        = "NO_HINTING",
    bold_brightens_ansi_colors = "No",
    force_reverse_video_cursor = true,
    default_cursor_style       = "BlinkingUnderline",
    window_decorations         = "RESIZE",
    window_padding             = { left = 35, right = 35, top = 18, bottom = 18 },
    enable_tab_bar             = false,
    use_fancy_tab_bar          = false,
    hide_tab_bar_if_only_one_tab = true,

    -- Menu
    launch_menu = launch_menu,

    -- Keys
    disable_default_key_bindings = true,
    keys                         = keys,
  }
''
