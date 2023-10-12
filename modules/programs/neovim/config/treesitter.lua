-- The default parser_install_dir is managed by nix, which is readonly
-- so we need to use anther path
local parser_install_dir = "~/.config/nvim-plugins/treesitter/parsers"
vim.opt.runtimepath:append(parser_install_dir)

require("nvim-treesitter.configs").setup({
  parser_install_dir = parser_install_dir,
  ensure_installed = {
    'lua',
    'typescript',
    'python',
    'bash',
    'c',
    'javascript',
    'html',
    'css',
    'java',
    'dockerfile',
    'json',
    'markdown',
    'nix',
    'yaml',
    'xml',
    'terraform',
    'sql',
    'groovy'
  },
  auto_install = true,
  sync_install = true,
  autotag = {
    enable = true
  },
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true,
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?'
    }
  }
})
