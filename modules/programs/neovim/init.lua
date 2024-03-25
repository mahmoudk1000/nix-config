-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Highlight on yank
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank() end,
  group = highlight_group,
  pattern = '*',
})

-- Options
vim.o.termguicolors = true                              -- Enable true color support in the terminal
vim.o.cursorline = false                                -- Set highlight cursor
vim.o.hlsearch = false                                  -- Disable highlighting on search
vim.wo.number = true                                    -- Show line numbers by default
vim.o.mouse = "a"                                       -- Enable mouse mode
vim.o.breakindent = true                                -- Enable break indent
vim.o.undofile = true                                    -- Save undo history
vim.o.ignorecase = true                                 -- Enable case-insensitive searching, unless /C or capital in search
vim.o.smartcase = true                                  -- Enable smart case searching
vim.o.updatetime = 250                                  -- Decrease update time
vim.wo.signcolumn = "yes"                               -- Always show sign column
vim.o.autoindent = true                                 -- Enable auto-indentation
vim.o.clipboard = "unnamedplus"                         -- Use system clipboard
vim.o.expandtab = true                                  -- Expand tabs to spaces
vim.o.tabstop = 4                                       -- Number of spaces per tab
vim.o.shiftwidth = 4                                    -- Number of spaces for auto-indent
vim.o.softtabstop = 4                                   -- Number of spaces in Tab key's behavior
vim.o.list = true                                       -- Display list characters
vim.opt.spell = true                                    -- Enable spell checking
vim.opt.smartindent = true                              -- Enable smart indentation
vim.opt.backspace = { "indent", "eol", "start" }        -- Allow backspacing over everything in insert mode
vim.opt.spelllang = { "en_us" }                         -- Set the spell checking language
vim.opt.listchars:append("space:⋅")                     -- Show a special character for spaces
vim.opt.listchars:append("eol:↴")                       -- Show a special character for end of line

-- Color Scheme
vim.cmd [[colorscheme neuewelt]]

-- Keymaps
vim.keymap.set({ "n", "v" }, '<Space>', "<Nop>", { silent = true })

-- Move text up and down (visual mode)
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Move text up and down (insert mode)
vim.keymap.set("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })

-- Duplicate Line
vim.keymap.set("n", "<A-C-Down>", "yyP", { noremap = true, silent = true })
vim.keymap.set("n", "<A-C-Up>", "yyp", { noremap = true, silent = true })
vim.keymap.set("i", "<A-C-d>", "<Esc>:t.<CR>gi", { noremap = true, silent = true })

-- Default Text Editors
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true })
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true })
vim.keymap.set("n", "fq", ":q!<CR>", { noremap = true })
vim.keymap.set("n", "qq", ":q<CR>", { noremap = true })
vim.keymap.set('i', "<A-d>", "<C-o>dd", { noremap = true, silent = true })
vim.keymap.set("i", "<C-b>", "<ESC>^i", { noremap = true })
vim.keymap.set("i", "<C-e>", "<End>", { noremap = true })

-- UI
vim.keymap.set("n", "<leader>v", ":vsplit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>h", ":split<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>w", ":set wrap<CR>", { noremap = true, silent = true })

-- Indent
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- Plugins
vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>f", ":Neotree focus<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-t>", ":ToggleTerm<CR>", {})
vim.keymap.set("n", "<A-f>", ":ToggleTerm direction=float<CR>", {})
vim.keymap.set("n", "<leader>md", ":Glow<CR>", { noremap=true, silent=true })
vim.keymap.set("n", "<A-Right>", ":BufferLineCycleNext<CR>", { noremap=true, silent=true })
vim.keymap.set("n", "<A-Left>", ":BufferLineCyclePrev<CR>", { noremap=true, silent=true })

-- Telescope
vim.keymap.set("n", "<leader>/", function()
  require('telescope.builtin').current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })
vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>gc", require("telescope.builtin").git_commits, { desc = "Search by [G]it [C]omment" })
vim.keymap.set("n", "<leader>gs", require("telescope.builtin").git_status, { desc = "Search by [G]it [S]tatus" })
vim.keymap.set("n", "<A-Tab>", require("telescope.builtin").buffers, { desc = "Show Buffers" })


-- Once the plugins have been loaded, Lua-based plugins need to be required and started up
-- For plugins with their own configuration file, that file is loaded and is responsible for
-- starting them. Otherwise, the plugin itself is required and its `setup` method is called.
require("Comment").setup()
require("colorizer").setup()
require("gitsigns").setup()
require("cmp_git").setup()
require("tmux").setup()
require("nvim-autopairs").setup()
require("copilot_cmp").setup()
require("nvim-surround").setup()
