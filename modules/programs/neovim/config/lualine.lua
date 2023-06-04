local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = {
  blue   = '#90A8BE',
  green  = '#D0F1d5',
  black  = '#0C1115',
  white  = '#E7E7E8',
  red    = '#F6BAB5',
  violet = '#D7C8F3',
  dark   = '#11171D',
}

local my_theme = {
  normal = {
    a = { fg = colors.dark, bg = colors.blue },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.dark, bg = colors.dark },
  },

  insert = { a = { fg = colors.dark, bg = colors.violet } },
  visual = { a = { fg = colors.dark, bg = colors.green } },
  replace = { a = { fg = colors.dark, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

lualine.setup({
  options = {
    theme = my_theme,
    component_separators = { left = "", right = "" },
    section_separators = { left = '█▓▒', right = '▒▓█' },
    disabled_filetypes = {
      statusline = { "dashboard", "NvimTree", "NeoTree" },
    },
    ignore_focus = { "NvimTree", "NeoTree" },
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
    },
  },
  sections = {
    lualine_a = { 
      { 'mode', separator = { left = '▒▓█' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = { 'fileformat' },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '█▓▒' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {
    minimap, 
    'nvim-tree', 
    'fugitive' 
  },
})
