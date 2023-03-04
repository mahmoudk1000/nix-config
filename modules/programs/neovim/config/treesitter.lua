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
