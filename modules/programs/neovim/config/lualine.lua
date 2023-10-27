-- Color table for highlights
-- stylua: ignore
local colors = {
  blue   = '#90A8BE',
  green  = '#D0F1d5',
  black  = '#1A242D',
  white  = '#E7E7E8',
  red    = '#F6BAB5',
  violet = '#D7C8F3',
  dark   = '#11171D',
}

local my_theme = {
  normal = {
    a = { fg = colors.dark, bg = colors.blue, gui = 'bold' },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.dark, bg = colors.dark },
  },

  insert = { a = { fg = colors.dark, bg = colors.violet, gui = 'bold' } },
  visual = { a = { fg = colors.dark, bg = colors.green, gui = 'bold' } },
  replace = { a = { fg = colors.dark, bg = colors.red, gui = 'bold' } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

require("lualine").setup({
  options = {
    theme = my_theme,
    icons_enabled = true,
    always_divide_middle = true,
    globalstatus = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = '█▓▒', right = '▒▓█' },
    disabled_filetypes = {
      statusline = { 'dashboard', 'NvimTree', 'neo-tree' },
    },
    ignore_focus = { 'NvimTree', 'NeoTree', 'neo-tree' },
    refresh = {
      statusline = 1000
    },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '▒▓█' }, right_padding = 2 },
    },
    lualine_b = { 'branch' },
    lualine_c = { 'diff' },
    lualine_x = { { 'diagnostics', sources = { 'nvim_diagnostic', 'coc' } } },
    lualine_y = { 'filename' },
    lualine_z = {
      { 'location', separator = { right = '█▓▒' }, left_padding = 2 },
    },
  },
  inactive_sections = {},
  tabline = {},
  extensions = {
    'nvim-tree',
    'neo-tree',
    'fugitive',
    'toggleterm'
  }
})
