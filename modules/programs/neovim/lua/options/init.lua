-- Disable netrw (we use other file explorers)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- User Interface
vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = false
vim.o.signcolumn = "yes"
vim.o.list = true
vim.o.listchars = "space:⋅,eol:↴,tab:→ ,nbsp:␣,trail:·"
vim.o.wrap = true
vim.o.wrapmargin = 8
vim.o.linebreak = true
vim.o.breakindent = true
vim.o.joinspaces = false
vim.o.wildmenu = true
vim.o.wildmode = "longest,full"
vim.o.hidden = true

-- Search
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Editing
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.shiftround = true
vim.o.backspace = "indent,eol,start"
vim.o.formatoptions = "jqlnt"
vim.o.fcs = "eob: "
vim.o.virtualedit = "block"
vim.o.showmatch = true
vim.o.inccommand = "nosplit"

-- Splits
vim.o.splitbelow = true
vim.o.splitright = true

-- Clipboard
vim.o.clipboard = "unnamedplus"
if vim.fn.has("wsl") == 1 then
	vim.g.clipboard = {
		name = "WslClipboard",
		copy = {
			["+"] = "clip.exe",
			["*"] = "clip.exe",
		},
		paste = {
			["+"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
			["*"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		},
		cache_enabled = 0,
	}
else
	vim.g.clipboard = {
		name = "xsel",
		copy = {
			["+"] = "xsel -bi",
			["*"] = "xsel -bi",
		},
		paste = {
			["+"] = "xsel -bo",
			["*"] = "xsel -bo",
		},
		cache_enabled = 0,
	}
end

-- Mouse
vim.o.mouse = "n"

-- Undo
vim.o.undofile = true

-- Spelling
vim.o.spell = true
vim.o.spelllang = "en_us"
vim.o.spelloptions = "camel"

-- Completion
vim.o.omnifunc = "syntaxcomplete#Complete"
vim.o.completeopt = "menu,menuone,noselect"

-- Encoding
vim.o.encoding = "utf-8"

-- Folding
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldlevelstart = 99
vim.o.foldnestmax = 10
vim.o.foldenable = false
vim.o.foldlevel = 99
vim.opt.foldcolumn = "0"
vim.opt.fillchars:append({ fold = " " })

-- Command line & Timings
vim.o.cmdheight = 0
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Providers (Disable unused)
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
