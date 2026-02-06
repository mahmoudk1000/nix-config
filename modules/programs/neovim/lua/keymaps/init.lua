vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Move lines up/down (Visual mode)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better indenting
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true, desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true, desc = "Indent right and reselect" })

-- Duplicate Line
vim.keymap.set("n", "<A-C-Down>", "yyP", { noremap = true, silent = true })
vim.keymap.set("n", "<A-C-Up>", "yyp", { noremap = true, silent = true })
vim.keymap.set("v", "<leader>ds", "y'>p", { noremap = true, silent = true, desc = "[D]uplicate [S]election" })

-- Comments
vim.keymap.set("n", "<leader>c", "gcc", { remap = true, silent = true, desc = "[C]omment Line" })
vim.keymap.set("v", "<leader>/", "gc", { remap = true, silent = true, desc = "[C]omment Selection" })

-- Helpers for dealing with other people's code
vim.keymap.set("n", "\\t", "<cmd>set ts=4 sts=4 sw=4 noet<cr>", { desc = "Set tabs" })
vim.keymap.set("n", "\\s", "<cmd>set ts=4 sts=4 sw=4 et<cr>", { desc = "Set spaces" })

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

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })

-- Clipboard operations
vim.keymap.set({ "v", "x", "n" }, "<leader>y", '"+y', { noremap = true, silent = true, desc = "Yank to clipboard" })
vim.keymap.set(
	{ "n", "v", "x" },
	"<leader>Y",
	'"+yy',
	{ noremap = true, silent = true, desc = "Yank line to clipboard" }
)
vim.keymap.set({ "n", "v", "x" }, "<leader>p", '"+p', { noremap = true, silent = true, desc = "Paste from clipboard" })
vim.keymap.set(
	"i",
	"<C-p>",
	"<C-r><C-p>+",
	{ noremap = true, silent = true, desc = "Paste from clipboard from within insert mode" }
)
vim.keymap.set(
	"x",
	"<leader>P",
	'"_dP',
	{ noremap = true, silent = true, desc = "Paste over selection without erasing unnamed register" }
)

-- Buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { noremap = true, silent = true, desc = "Go to next buffer" })
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Go to previous buffer" })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true, desc = "Delete current buffer" })
vim.keymap.set("n", "<leader>bD", ":bufdo bdelete<CR>", { noremap = true, silent = true, desc = "Delete all buffers" })

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
