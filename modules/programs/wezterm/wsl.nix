{
  lib,
  theme,
  font,
  host ? {
    isWSL = true;
  },
  ...
}:

let
  inherit (host) username;
  shared = import ./shared.nix {
    inherit lib theme font;
    fontFallback = [ "IosevkaTerm NF" ];
  };
in
''
  ${shared.font}
  ${shared.colors}
  ${shared.scheme}

  local leader = { key = " ", mods = "CTRL", timeout_milliseconds = 1000 }

  local keys = {
    -- General
    { key = "?", mods = "SHIFT|CTRL", action = wezterm.action.ShowLauncher },
    { key = "F", mods = "CTRL", action = wezterm.action.ToggleFullScreen },
    { key = "C", mods = "CTRL", action = wezterm.action.CopyTo("ClipboardAndPrimarySelection") },
    { key = "V", mods = "CTRL", action = wezterm.action.PasteFrom("Clipboard") },

    -- Font size
    { key = "j", mods = "ALT", action = wezterm.action.DecreaseFontSize },
    { key = "k", mods = "ALT", action = wezterm.action.IncreaseFontSize },
    { key = ".", mods = "ALT", action = wezterm.action.ResetFontSize },

    -- Scroll
    { key = "j", mods = "ALT|SHIFT", action = wezterm.action.ScrollByPage(0.5) },
    { key = "k", mods = "ALT|SHIFT", action = wezterm.action.ScrollByPage(-0.5) },

    -- Tabs
    { key = "T", mods = "ALT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
    { key = "Q", mods = "ALT", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
    { key = "h", mods = "ALT|CTRL", action = wezterm.action.MoveTabRelative(-1) },
    { key = "l", mods = "ALT|CTRL", action = wezterm.action.MoveTabRelative(1) },

    -- Panes
    { key = "q", mods = "ALT", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
    { key = "v", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "h", mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "j", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Down") },
    { key = "k", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Up") },
    { key = "H", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Left", 3 }) },
    { key = "J", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Down", 3 }) },
    { key = "K", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Up", 3 }) },
    { key = "L", mods = "LEADER", action = wezterm.action.AdjustPaneSize({ "Right", 3 }) },

    -- Pane-first navigation: switch to the neighbor pane, or the neighbor tab if there is none.
    {
      key = "h",
      mods = "CTRL|SHIFT",
      action = wezterm.action_callback(function(window, pane)
        local tab = window:mux_window():active_tab()
        if tab:get_pane_direction("Left") ~= nil then
          window:perform_action(wezterm.action.ActivatePaneDirection("Left"), pane)
        else
          window:perform_action(wezterm.action.ActivateTabRelative(-1), pane)
        end
      end),
    },
    {
      key = "l",
      mods = "CTRL|SHIFT",
      action = wezterm.action_callback(function(window, pane)
        local tab = window:mux_window():active_tab()
        if tab:get_pane_direction("Right") ~= nil then
          window:perform_action(wezterm.action.ActivatePaneDirection("Right"), pane)
        else
          window:perform_action(wezterm.action.ActivateTabRelative(1), pane)
        end
      end),
    },
  }

  -- Alt+1..6 jumps to the nth tab.
  for i = 1, 6 do
    keys[#keys + 1] = { key = tostring(i), mods = "ALT|SHIFT", action = wezterm.action.ActivateTab(i - 1) }
  end

  local launch_menu = {
    { label = "PowerShell", args = { "pwsh.exe", "-NoLogo" } },
    { label = "PowerShell --norc", args = { "pwsh.exe", "-NoProfile", "-NoLogo" } },
    { label = "PowerShell v5", args = { "powershell.exe", "-NoLogo" } },
    { label = "Git Bash", args = { "C:\\Program Files\\Git\\usr\\bin\\bash.exe" } },
  }

  -- Short, clean names for the tab bar.
  local function short(s)
    return #s > 20 and s:sub(1, 20) .. "..." or s
  end

  local function clean_title(tab)
    local title = tab.tab_title
    if title and #title > 0 then
      return short(title)
    end
    local lower = tab.active_pane.title:lower()
    if lower:find("powershell") or lower:find("pwsh") then
      return "PowerShell"
    elseif lower:find("wslhost") then
      return "WSL"
    end
    return short(tab.active_pane.title:gsub("%.exe$", ""):gsub("^%l", string.upper))
  end

  wezterm.on("format-tab-title", function(tab, _, _, _, hover)
    local fg = colors.foreground
    local prefix, suffix = " ", " "
    if tab.is_active then
      fg, prefix, suffix = colors.ansi[5], "[ ", " ]"
    elseif hover then
      fg = colors.ansi[4]
    end
    return {
      { Background = { Color = colors.background } },
      { Foreground = { Color = fg } },
      { Text = prefix .. clean_title(tab) .. suffix },
    }
  end)

  return {
    -- WSL: open the NixOS distro by default.
    wsl_domains = {
      { name = "WSL:NixOS", distribution = "NixOS", default_cwd = "/home/${username}" },
    },
    default_domain = "local",
    default_prog   = { "wsl.exe", "-d", "NixOS", "--cd", "~" },
    launch_menu    = launch_menu,

    -- Appearance
    color_schemes              = { default = color_scheme },
    color_scheme               = "default",
    font                       = font,
    font_size                  = 10.0,
    command_palette_font_size  = 9.0,
    window_decorations         = "RESIZE",
    window_padding             = { left = 24, right = 24, top = 8, bottom = 8 },
    default_cursor_style       = "BlinkingUnderline",
    force_reverse_video_cursor = true,
    bold_brightens_ansi_colors = "No",

    -- Rendering
    front_end           = "OpenGL",
    unicode_version     = 16,
    freetype_load_flags = "NO_HINTING",
    custom_block_glyphs = true,
    term                = "xterm-256color",

    -- Tab bar
    enable_tab_bar                             = true,
    tab_bar_at_bottom                          = true,
    hide_tab_bar_if_only_one_tab               = true,
    show_new_tab_button_in_tab_bar             = false,
    show_tab_index_in_tab_bar                  = false,
    switch_to_last_active_tab_when_closing_tab = true,
    tab_max_width                              = 30,

    -- Behavior
    audible_bell                    = "Disabled",
    check_for_updates               = false,
    hide_mouse_cursor_when_typing   = true,
    scrollback_lines                = 5000,
    window_close_confirmation       = "NeverPrompt",
    skip_close_confirmation_for_processes_named = {
      "zsh", "bash", "tmux",
      "cmd.exe", "pwsh.exe", "powershell.exe",
      "wsl.exe", "wslhost.exe", "conhost.exe",
    },

    -- Keys
    disable_default_key_bindings = true,
    leader                       = leader,
    keys                         = keys,
  }
''
