require("lualine").setup({
  options = {
    theme = {
      normal = { a = "LuaLineNormalA", b = "LuaLineNormalB", c = "LuaLineNormalC" },
      insert = { a = "LuaLineInsertA" },
      visual = { a = "LuaLineVisualA" },
      replace = { a = "LuaLineReplaceA" }
    },
    icons_enabled = true,
    always_divide_middle = true,
    globalstatus = true,
    component_separators = "|",
    section_separators = { right = "▒▓█", left = "█▓▒" },
    disabled_filetypes = {
      statusline = { "neo-tree" },
    },
    ignore_focus = { "neo-tree" },
    refresh = {
      statusline = 1000
    },
  },
  sections = {
    lualine_a = {
      { "mode", separator = { left = "▒▓█" }, right_padding = 2 },
    },
    lualine_b = { { "filename", file_status = false, path = 1 }, { "branch", icon = "󰘬" } },
    lualine_c = { "diff" },
    lualine_x = { { "diagnostics", sources = { "nvim_diagnostic" } } },
    lualine_y = { "%p%%/%L" },
    lualine_z = {
      { "location", separator = { right = "█▓▒" }, left_padding = 2 },
    },
  },
  extensions = {
    'neo-tree',
    'fugitive',
    'toggleterm'
  }
})
