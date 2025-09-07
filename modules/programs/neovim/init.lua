-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Performance optimizations
vim.opt.updatetime = 100
vim.opt.timeout = true
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 10

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
	group = highlight_group,
	pattern = "*",
})

-- Options
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.opt.cursorline = false
vim.opt.hlsearch = false
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.linebreak = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.autoindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.list = true
vim.opt.omnifunc = "syntaxcomplete#Complete"
vim.opt.wrap = true
vim.opt.spell = true
vim.opt.smartindent = true
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.spelllang = { "en_us" }
vim.opt.listchars = { space = "⋅", eol = "↴", tab = "→ " }
vim.opt.shell = "zsh"
vim.opt.belloff = "all"
vim.opt.fileencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.scriptencoding = "utf-8"
vim.o.cmdheight = 0

-- Color Scheme
vim.cmd([[colorscheme islet]])

-- Disable space in normal and visual mode (since it's our leader)
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.keymap.set("n", "<space>n", ":NvimTreeToggle<CR>", { noremap = true })

-- Move lines up/down (Visual mode)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move selection up" })

-- Better indenting
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true, desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true, desc = "Indent right and reselect" })

-- Duplicate Line
vim.keymap.set("n", "<A-C-Down>", "yyP", { noremap = true, silent = true })
vim.keymap.set("n", "<A-C-Up>", "yyp", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>ds", "y'>p", { noremap = true, silent = true, desc = "[D]uplicate [S]election" })

-- Comments
vim.keymap.set("n", "<leader>c", "gcc", { remap = true, silent = true, desc = "[[C]]omment Line" })
vim.keymap.set("v", "<leader>/", "gc", { remap = true, silent = true, desc = "[[C]]omment Selection" })

-- Paste without losing register
vim.keymap.set("x", "<leader>p", [["_dP]], { noremap = true, silent = true, desc = "Paste without losing register" })

-- WINDOW MANAGEMENT - <leader>w prefix
vim.keymap.set("n", "<leader>wh", "<C-w>h", { noremap = true, silent = true, desc = "Go to left window" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { noremap = true, silent = true, desc = "Go to bottom window" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { noremap = true, silent = true, desc = "Go to top window" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { noremap = true, silent = true, desc = "Go to right window" })

vim.keymap.set("n", "<leader>w=", "<C-w>=", { noremap = true, silent = true, desc = "Equalize window sizes" })
vim.keymap.set("n", "<leader>w+", "<C-w>+", { noremap = true, silent = true, desc = "Increase window height" })
vim.keymap.set("n", "<leader>w-", "<C-w>-", { noremap = true, silent = true, desc = "Decrease window height" })
vim.keymap.set("n", "<leader>w<", "<C-w><", { noremap = true, silent = true, desc = "Decrease window width" })
vim.keymap.set("n", "<leader>w>", "<C-w>>", { noremap = true, silent = true, desc = "Increase window width" })

-- Plugins
--- NvimTree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

--- ToggleTerm
vim.keymap.set("n", "<A-t>", ":ToggleTerm<CR>", {})
vim.keymap.set("n", "<A-f>", ":ToggleTerm direction=float<CR>", {})

--- Bufferline
vim.keymap.set("n", "<A-Right>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-Left>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

--- Conform
vim.keymap.set("n", "<leader>f", function()
	require("conform").format()
end, { desc = "[F]ormat Buffer" })

--- Telescope
vim.keymap.set("n", "<leader>/", function()
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer]" })
vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>gc", require("telescope.builtin").git_commits, { desc = "Search by [G]it [C]omment" })
vim.keymap.set("n", "<leader>gs", require("telescope.builtin").git_status, { desc = "Search by [G]it [S]tatus" })
vim.keymap.set("n", "<A-Tab>", require("telescope.builtin").buffers, { desc = "Show Buffers" })

-- Replace
vim.keymap.set(
	"n",
	"<leader>sr",
	":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
	{ noremap = true, desc = "Search and replace word under cursor" }
)
vim.keymap.set("v", "<leader>sr", ":s/", { noremap = true, desc = "Search and replace in selection" })

-- Save and quit
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true, desc = "Save file" })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { noremap = true, silent = true, desc = "Save file (insert mode)" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true, silent = true, desc = "Quit" })
vim.keymap.set("n", "<leader>Q", ":qa<CR>", { noremap = true, silent = true, desc = "Quit all" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true, desc = "Save file" })

-- Filetypes
vim.filetype.add({
	extensions = {
		sh = "sh",
		env = "sh",
		mdx = "markdown",
		tfvars = "terraform",
		tfstate = "json",
		latex = "tex",
		bib = "tex",
		html = "html",
		h = "c",
	},
	filename = {
		["Jenkinsfile"] = "groovy",
		["kubeconfig"] = "yaml",
	},
	pattern = {
		["Dockerfile[^/]*"] = "dockerfile",
		["docker%-compose%.y.?ml"] = "yaml.docker-compose",
	},
})

-- Once the plugins have been loaded, Lua-based plugins need to be required and started up
-- For plugins with their own configuration file, that file is loaded and is responsible for
-- starting them. Otherwise, the plugin itself is required and its `setup` method is called.
require("colorizer").setup({})
require("gitsigns").setup({})
require("cmp_git").setup({})
require("tmux").setup({})
require("nvim-autopairs").setup({})
require("copilot_cmp").setup({})
