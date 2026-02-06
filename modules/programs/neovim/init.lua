-- Set leader keys first (before loading any plugins)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set color scheme
vim.cmd.colorscheme("islet")

-- ============================================================================
-- Plugin Configuration with lz.n
-- ============================================================================
-- Register lzextras LSP handler for easier LSP configuration
-- This must be done before loading any plugin specs
require("lze").register_handlers(require("lzextras").lsp)

-- Load core configuration modules
require("options")
require("keymaps")
require("autocmds")
require("plugins")
