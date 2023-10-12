require("ibl").setup({
  indent = {
    char = '┊',
    tab_char = "→"
  },
  scope = {
    enabled = true,
    show_start = false,
    show_end = false
  },
  whitespace = {
    remove_blankline_trail = true
  },
  exclude = {
    filetypes = {
      "help",
      "terminal",
      "dashboard",
      "alpha",
      "packer",
      "TelescopePrompt",
      "TelescopeResults",
      "mason",
      "v"
    },
    buftypes = {
      "terminal"
    }
  }
})
