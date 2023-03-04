-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
local keymap = vim.keymap.set
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

-- stylua: ignore start
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'                                                                             -- Package manager
  use 'nvim-lua/popup.nvim'                                                                                -- Popup API
  use 'stevearc/dressing.nvim'                                                                             -- Neovim UI Enhancer
  use 'windwp/nvim-ts-autotag'                                                                             -- Autoclose tags
  use 'norcalli/nvim-colorizer.lua'                                                                        -- Color highlighting
  use 'windwp/nvim-autopairs'                                                                              -- Autopairs
  use 'akinsho/toggleterm.nvim'                                                                            -- Terminal
  use 'lukas-reineke/indent-blankline.nvim'                                                                -- Indentation
  use 'tpope/vim-fugitive'                                                                                 -- Git commands in nvim
  use 'karb94/neoscroll.nvim'                                                                              -- Smooth scrolling
  use 'tpope/vim-rhubarb'                                                                                  -- Fugitive-companion to interact with github
  use 'goolord/alpha-nvim'                                                                                 -- fast and fully customizable greeter for neovim
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }                                -- Add git related info in the signs columns and popups
  use 'numToStr/Comment.nvim'                                                                              -- "gc" to comment visual regions/lines
  use 'nvim-treesitter/nvim-treesitter'                                                                    -- Highlight, edit, and navigate code
  use 'nvim-treesitter/nvim-treesitter-textobjects'                                                        -- Additional textobjects for treesitter
  use 'neovim/nvim-lspconfig'                                                                              -- Collection of configurations for built-in LSP client
  use 'williamboman/mason.nvim'                                                                            -- LSP
  use 'williamboman/mason-lspconfig.nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp' } }                                        -- Autocompletion
  use 'akinsho/bufferline.nvim'
  use { 'L3MON4D3/LuaSnip', requires = { 'saadparwaiz1/cmp_luasnip' } }                                    -- Snippet Engine and Snippet Expansion
  use 'nvim-lualine/lualine.nvim'                                                                          -- Fancier statusline
  use 'kyazdani42/nvim-tree.lua'                                                                           -- File Tree
  use 'nvim-lua/plenary.nvim'                                                                              -- Yet Another Python Formatter
  use 'lewis6991/impatient.nvim'                                                                           -- Speed loading Lua modules and files.
  use 'tpope/vim-sleuth'                                                                                   -- Detect tabstop and shiftwidth automatically
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }                          -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable "make" == 1 }   -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available

  if is_bootstrap then
    require('packer').sync()
  end
end)
-- stylua: ignore end

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

-- Highlight on yank
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Setting options
vim.o.cursorline = true                      -- Set highlight cursor
vim.o.hlsearch = false                       -- Set highlight on search
vim.wo.number = true                         -- Make line numbers default
vim.o.mouse = "a"                            -- Enable mouse mode
vim.o.breakindent = true                     -- Enable break indent
vim.o.undofile = true                        -- Save undo history
vim.o.ignorecase = true                      -- Case insensitive searching UNLESS /C or capital in search
vim.o.smartcase = true
vim.o.updatetime = 250                       -- Decrease update time
vim.wo.signcolumn = 'yes'
vim.o.autoindent = true
vim.o.clipboard = "unnamedplus"              -- use system clipboard by default
vim.o.completeopt = 'menuone,noselect'       -- Set completeopt to have a better completion experience
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

vim.o.termguicolors = true                   -- Set colorscheme
vim.cmd [[colorscheme dunkelsee]]

-- Keymaps
-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Move text up and down (visual mode)
keymap("v", "<A-Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Move text up and down (insert mode)
keymap("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
keymap("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })

-- Default Text Editors Keymaps
keymap('n', '<c-s>', ':w<CR>', {})
keymap('n', 'Q', '<c-v>', {})
keymap('n', 'fq', ':q!<CR>', {})
keymap('n', 'qq', ':q<CR>', {})

-- UI
keymap('n', '<leader>v', ':vsplit<CR>', {})
keymap('n', '<leader>s', ':split<CR>', {})
keymap('n', '<leader>t', ':vsplit<CR>:terminal<CR>', {})
keymap('n', '<leader>w', ':set wrap<CR>', {})

-- Indent
keymap("v", "<", "<gv", { noremap = true, silent = true })
keymap("v", ">", ">gv", { noremap = true, silent = true })

-- Plugins
keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
keymap('n', '<C-f>', ':lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })

-- Telescope
keymap('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })
keymap('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
keymap('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
keymap('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
keymap('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
keymap('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Once the plugins have been loaded, Lua-based plugins need to be required and started up
-- For plugins with their own configuration file, that file is loaded and is responsible for
-- starting them. Otherwise, the plugin itself is required and its `setup` method is called.
require('Comment').setup()
require('colorizer').setup()
require('nvim-autopairs').setup()
require('gitsigns').setup()
require('nvim-tree').setup()
require('neoscroll').setup()
require('lspconfig')
require('impatient')

-- Mason
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✔",
            package_pending = "‽",
            package_uninstalled = "✘"
        }
    }
})
require("mason-lspconfig").setup()

-- Telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}
-- Github
require('gitsigns').setup {
  signs = {
    add = { text = '🞧' },
    change = { text = '⏺' },
    delete = { text = '🭸' },
    topdelete = { text = '🭶' },
    changedelete = { text = '~' },
  },
}
