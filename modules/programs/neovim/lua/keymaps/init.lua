local map = vim.keymap.set

-- Navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move left" })
map("n", "<C-j>", "<C-w>j", { desc = "Move down" })
map("n", "<C-k>", "<C-w>k", { desc = "Move up" })
map("n", "<C-l>", "<C-w>l", { desc = "Move right" })

-- Resize
map("n", "<C-Up>", ":resize +2<CR>", { desc = "Height +" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Height -" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Width -" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Width +" })

-- Scrolling
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })
map("n", "n", "nzzzv", { desc = "Next" })
map("n", "N", "Nzzzv", { desc = "Prev" })

-- Editing
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move up" })
map("n", "J", "mzJ`z", { desc = "Join lines" })
map("v", "p", '"_dP', { desc = "Paste" })
map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete" })
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank" })
map("n", "<leader>Y", '"+Y', { desc = "Yank line" })

-- Quick actions
map("n", "<C-s>", ":w<CR>", { desc = "Save" })
map("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Save" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>Q", ":qa!<CR>", { desc = "Quit all" })
map("n", "<Esc>", ":noh<CR>", { desc = "Clear search" })

-- Buffers
map("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-h>", ":bprevious<CR>", { desc = "Prev buffer" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- Terminal
map("t", "<Esc><Esc>", "<C-><C-n>", { desc = "Exit terminal" })

-- Diagnostics
map("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Prev diagnostic" })
map("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })

-- Toggles
map("n", "<leader>ts", function()
	vim.o.spell = not vim.o.spell
end, { desc = "Toggle spell" })

map("n", "<leader>tw", function()
	vim.o.wrap = not vim.o.wrap
end, { desc = "Toggle wrap" })
