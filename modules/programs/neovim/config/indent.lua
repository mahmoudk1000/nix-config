local present, indent_blankline = pcall(require, "indent_blankline")

if not present then
  return
end

indent_blankline.setup({
  char = '┊',
  space_char_blankline = " ",
  indentLine_enabled = 1,
  show_trailing_blankline_indent = true,
  show_first_indent_level = false,
  show_current_context = true,
  show_current_context_start = true,
  use_treesitter = true,
  filetype_exclude = {
    "help",
    "terminal",
    "dashboard",
    "alpha",
    "packer",
    "TelescopePrompt",
    "TelescopeResults",
    "mason",
    ""
  },
  buftype_exclude = { 
    "terminal",
    "alpha",
    "nofile", 
  },
})
