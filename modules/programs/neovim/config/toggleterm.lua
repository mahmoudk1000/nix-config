require("toggleterm").setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  hide_numbers = true,
  open_mapping = "<C-x>",
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '1',
  start_in_insert = true,
  persist_size = true,
  persist_mode = false,
  close_on_exit = true,
  shell = vim.o.shell,
  direction = 'horizontal',
  highlights = {
    -- highlights which map to a highlight group name and a table of it's values
    -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
    Normal = {
      guibg  = "#11171D"
    },
    NormalFloat = {
      guibg = "#11171D"
    },
    FloatBorder = {
      guifg = "#24313D",
      guibg = "#24313D"
    },
  },
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'single',
    -- like `size`, width and height can be a number or function which is passed the current terminal
    winblend = 3,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})
