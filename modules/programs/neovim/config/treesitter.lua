-- The default parser_install_dir is managed by nix, which is readonly
-- so we need to use anther path
local parser_install_dir = "~/.config/nvim-plugins/treesitter/parsers"
vim.opt.runtimepath:append(parser_install_dir)

local present, treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
  return
end

treesitter.setup {
  autotag = {
    enable = true,
  },
  ensure_installed = { 
    'lua',
    'typescript',
    'rust',
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
  },
  highlight = { 
    enable = true 
  },
  indent = { 
    enable = true 
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      -- TODO: I'm not sure for this one.
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
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
          show_help = '?',
      },
  },
  query_linter = {
      enable = true,
      use_virtual_text = true,
      lint_events = {"BufWrite", "CursorHold"},
  },
  parser_install_dir = parser_install_dir,
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}
