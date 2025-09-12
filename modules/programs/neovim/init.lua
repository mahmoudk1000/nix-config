-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Options
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- User Interface
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = false
vim.opt.signcolumn = "yes"
vim.opt.list = true
vim.opt.listchars = { space = "⋅", eol = "↴", tab = "→ ", nbsp = "␣", trail = "·" }
vim.opt.wrap = true
vim.opt.linebreak = true
vim.o.breakindent = true

-- Search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Editing
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.backspace = { "indent", "eol", "start" }

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Mouse
vim.opt.mouse = "a"

-- Undo
vim.opt.undofile = true

-- Spelling
vim.opt.spell = true
vim.opt.spelllang = { "en_us" }

-- Completion
vim.opt.omnifunc = "syntaxcomplete#Complete"
vim.o.completeopt = "menu,preview,noselect"

-- Encoding
vim.opt.encoding = "utf-8"

-- Folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Command line & Timings
vim.o.cmdheight = 0
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Color Scheme
vim.cmd.colorscheme("islet")

-- [[ Disable auto comment on enter ]]
-- See :help formatoptions
vim.api.nvim_create_autocmd("FileType", {
	desc = "remove formatoptions",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- Disable space in normal and visual mode (since it's our leader)
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.keymap.set("n", "<space>n", ":NvimTreeToggle<CR>", { noremap = true })

-- Move lines up/down (Visual mode)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Moves Line Down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Moves Line Up" })

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

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>ee", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- You should instead use these keybindings so that they are still easy to use, but don't conflict
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

-- NOTE: Register a handler from lzextras. This one makes it so that
-- you can set up lsps within lze specs,
-- and trigger vim.lsp.enable and the rtp config collection only on the correct filetypes
-- it adds the lsp field used below
-- (and must be registered before any load calls that use it!)
require("lze").register_handlers(require("lzextras").lsp)

require("lze").load({
	{
		"blink.cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		after = function()
			require("blink.cmp").setup({
				snippets = { preset = "luasnip" },
				sources = {
					default = { "lsp", "path", "snippets", "buffer", "copilot" },
					providers = {
						copilot = {
							name = "copilot",
							module = "blink-copilot",
							score_offset = 100,
							async = true,
						},
						buffer = {
							opts = {
								get_bufnrs = function()
									return vim.tbl_filter(function(bufnr)
										return vim.bo[bufnr].buftype == ""
									end, vim.api.nvim_list_bufs())
								end,
							},
						},
					},
				},
				keymap = {
					preset = "enter",
					["<Tab>"] = {
						function(cmp)
							if cmp.is_menu_visible() then
								return require("blink.cmp").select_next()
							elseif cmp.snippet_active() then
								return cmp.snippet_forward()
							end
						end,
						"fallback",
					},
					["<S-Tab>"] = {
						function(cmp)
							if cmp.is_menu_visible() then
								return require("blink.cmp").select_prev()
							elseif cmp.snippet_active() then
								return cmp.snippet_backward()
							end
						end,
						"fallback",
					},
				},
				appearance = {
					kind_icons = {
						Text = "󰉿",
						Method = "󰆧",
						Function = "󰊕",
						Constructor = "",
						Field = "󰜢",
						Variable = "󰀫",
						Class = "󰠱",
						Interface = "",
						Module = "",
						Property = "󰜢",
						Unit = "󰑭",
						Value = "󰎠",
						Enum = "",
						Keyword = "󰌋",
						Snippet = "",
						Color = "󰏘",
						File = "󰈙",
						Reference = "󰈇",
						Folder = "󰉋",
						EnumMember = "",
						Constant = "󰏿",
						Struct = "󰙅",
						Event = "",
						Operator = "󰆕",
						Copilot = "󰚩",
						TypeParameter = "",
					},
				},
				completion = {
					keyword = {
						range = "prefix",
					},
					list = {
						selection = {
							preselect = false,
							auto_insert = true,
						},
					},
					accept = {
						auto_brackets = {
							enabled = true,
							override_brackets_for_filetypes = {
								tex = { "{", "}" },
							},
						},
					},
					menu = {
						min_width = 20,
						auto_show = true,
						border = "rounded",
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
						draw = {
							columns = {
								{ "label", "label_description", gap = 1 },
								{ "kind_icon" },
								{ "source_name" },
							},
						},
					},
					documentation = {
						auto_show = true,
						auto_show_delay_ms = 100,
						update_delay_ms = 50,
						window = {
							max_width = math.min(80, vim.o.columns),
							border = "rounded",
						},
					},
				},
				cmdline = {
					completion = {
						menu = {
							auto_show = true,
						},
						ghost_text = {
							enabled = false,
						},
						list = {
							selection = {
								preselect = false,
								auto_insert = true,
							},
						},
					},
				},
				signature = {
					enabled = true,
					window = {
						border = "rounded",
						scrollbar = false,
					},
				},
			})
		end,
	},

	{
		"nvim-lspconfig",
		priority = 90,
		on_require = { "lspconfig" },
		-- define a function to run over all type(plugin.lsp) == table
		-- when their filetype trigger loads them
		lsp = function(plugin)
			local capabilities = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())
			capabilities.general.positionEncodings = { "utf-16" }

			local config = plugin.lsp or {}
			config.capabilities = capabilities

			vim.lsp.config(plugin.name, config)
			vim.lsp.enable(plugin.name)
		end,
		before = function(_)
			vim.lsp.config("*", {
				on_attach = function(_, bufnr)
					local opts = { buffer = bufnr }

					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<leader>ds", vim.lsp.buf.document_symbol, opts)
					vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
				end,
			})
			vim.diagnostic.config({
				virtual_text = false,
				signs = true,
				underline = true,
				update_in_insert = false,
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = true,
					header = "",
					prefix = "",
					scope = "line",
				},
			})
		end,
	},

	{
		"bashls",
		lsp = {
			filetypes = { "sh", "bash" },
		},
	},

	{
		"jsonls",
		lsp = {
			filetypes = { "json", "jsonc" },
		},
	},

	{
		"marksman",
		lsp = {
			filetypes = { "markdown", "markdown.mdx" },
		},
	},

	{
		"yamlls",
		lsp = {
			filetypes = { "yaml", "yaml.docker-compose" },
		},
	},

	{
		"ansiblels",
		lsp = {
			filetypes = { "yaml.ansible" },
		},
	},

	{
		"dockerls",
		lsp = {
			filetypes = { "dockerfile" },
		},
	},

	{
		"docker_compose_language_service",
		lsp = {
			filetypes = { "yaml.docker-compose" },
		},
	},

	{
		"helm_ls",
		lsp = {
			filetypes = { "helm" },
		},
	},

	{
		"texlab",
		lsp = {
			filetypes = { "tex", "plaintex", "bib" },
		},
	},

	{
		"nixd",
		lsp = {
			filetypes = { "nix" },
			settings = {
				formatting = {
					command = { "nixfmt" },
				},
			},
		},
	},

	{
		"terraformls",
		lsp = {
			filetypes = { "terraform", "terraform-vars" },
		},
	},

	{
		"tflint",
		lsp = {
			filetypes = { "terraform" },
		},
	},

	{
		"jsonnet_ls",
		lsp = {
			filetypes = { "jsonnet", "libsonnet" },
		},
	},

	{
		"ruff",
		lsp = {
			filetypes = { "python" },
		},
	},

	{
		"gopls",
		lsp = {
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
		},
	},

	{
		"groovyls",
		lsp = {
			filetypes = { "groovy" },
			cmd = { "groovy-language-server" },
		},
	},

	{
		"java_language_server",
		lsp = {
			filetypes = { "java" },
			cmd = { "java-language-server" },
		},
	},

	{
		"lua_ls",
		lsp = {
			filetypes = { "lua" },
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					diagnostics = { globals = { "vim" } },
					workspace = {
						checkThirdParty = false,
						library = { vim.env.VIMRUNTIME },
					},
					telemetry = { enable = false },
				},
			},
		},
	},

	{
		"nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		priority = 100,
		after = function()
			require("nvim-treesitter.configs").setup({
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "gnn",
						node_incremental = "grn",
						node_decremental = "grm",
						scope_incremental = "grc",
					},
				},
			})
		end,
	},

	{
		"nvim-web-devicons",
		on_require = "nvim-web-devicons",
		after = function()
			require('nvim-web-devicons').setup({})
		end
	},

	{
		"nvim-tree.lua",
		keys = {
			{ "<space>n", ":NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
			{ "<C-n>", ":NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
		},
		cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeClose", "NvimTreeRefresh" },
		after = function()
			require("nvim-tree").setup({
				hijack_cursor = true,
				disable_netrw = true,
				hijack_netrw = true,
				prefer_startup_root = true,
				respect_buf_cwd = false,
				update_focused_file = {
					enable = true,
					update_root = true,
				},
				actions = {
					change_dir = { global = true },
					open_file = { quit_on_open = true },
				},
				renderer = {
					root_folder_label = false,
					full_name = false,
					add_trailing = false,
					group_empty = false,
					icons = {
						webdev_colors = false,
						git_placement = "after",
					},
					indent_markers = {
						enable = true,
					},
				},
				hijack_directories = {
					enable = true,
					auto_open = true,
				},
				view = {
					width = 35,
					adaptive_size = false,
					relativenumber = true,
				},
			})
			vim.api.nvim_create_autocmd({ "QuitPre" }, {
				callback = function()
					vim.cmd("NvimTreeClose")
				end,
			})
		end,
	},

	{
		"telescope.nvim",
		keys = {
			{
				"<leader>/",
				function()
					require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
						previewer = false,
					}))
				end,
				desc = "[/] Fuzzily search in current buffer]",
			},
			{
				"<leader>sf",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "[S]earch [F]iles",
			},
			{
				"<leader>sh",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "[S]earch [H]elp",
			},
			{
				"<leader>sw",
				function()
					require("telescope.builtin").grep_string()
				end,
				desc = "[S]earch current [W]ord",
			},
			{
				"<leader>sg",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "[S]earch by [G]rep",
			},
			{
				"<leader>gc",
				function()
					require("telescope.builtin").git_commits()
				end,
				desc = "[G]it [C]omits",
			},
			{
				"<leader>gs",
				function()
					require("telescope.builtin").git_status()
				end,
				desc = "[G]it [S]tatus",
			},
			{
				"<A-Tab>",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "[B]buffers",
			},
		},
		cmd = { "Telescope" },
		after = function()
			require("telescope").setup({
				defaults = {
					prompt_prefix = "   ",
					selection_caret = "  ",
					entry_prefix = "  ",
					color_devicons = true,
					initial_mode = "insert",
					selection_strategy = "reset",
					sorting_strategy = "ascending",
					layout_strategy = "horizontal",
					file_sorter = require("telescope.sorters").get_fuzzy_file,
					file_ignore_patterns = { "node_modules" },
					generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
					path_display = { "truncate" },
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.55,
							results_width = 0.8,
						},
						vertical = {
							mirror = false,
						},
						width = 0.87,
						height = 0.80,
						preview_cutoff = 120,
					},
					border = {},
					borderchars = {
						prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
						results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
						preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					},
					mappings = {
						i = {
							["<C-u>"] = false,
							["<C-d>"] = false,
						},
					},
				},
			})
		end,
	},

	{
		"gitsigns.nvim",
		event = { "BufRead" },
		after = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				signcolumn = true,
				numhl = false,
				linehl = false,
				word_diff = false,
				watch_gitdir = {
					follow_files = true,
				},
				auto_attach = true,
				attach_to_untracked = false,
				current_line_blame = false,
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil,
				max_file_length = 40000,
				preview_config = {
					border = "single",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
			})
		end,
	},

	{
		"toggleterm.nvim",
		keys = {
			{ "<A-t>", ":ToggleTerm<CR>", desc = "Toggle terminal" },
			{ "<A-f>", ":ToggleTerm direction=float<CR>", desc = "Toggle floating terminal" },
		},
		cmd = { "ToggleTerm" },
		after = function()
			require("toggleterm").setup({
				size = function(term)
					if term.direction == "horizontal" then
						return 15
					elseif term.direction == "vertical" then
						return vim.o.columns * 0.4
					end
				end,
				hide_numbers = true,
				open_mapping = [[<c-\>]],
				shade_filetypes = {},
				shade_terminals = true,
				shading_factor = "1",
				start_in_insert = true,
				persist_size = true,
				persist_mode = false,
				close_on_exit = true,
				auto_scroll = true,
				shell = vim.o.shell,
				direction = "horizontal",
				highlights = {
					Normal = { link = "Normal" },
					NormalFloat = { link = "NormalFloat" },
					WinSeparator = { link = "WinSeparator" },
					FloatBorder = { link = "FloatBorder" },
				},
				float_opts = {
					border = "single",
				},
			})
		end,
	},

	{
		"bufferline.nvim",
		event = "DeferredUIEnter",
		keys = {
			{ "<A-Right>", ":BufferLineCycleNext<CR>", desc = "Next buffer" },
			{ "<A-Left>", ":BufferLineCyclePrev<CR>", desc = "Previous buffer" },
		},
		after = function()
			require("bufferline").setup({
				highlights = {
					buffer_visible = {
						fg = string.format("#%06x", vim.api.nvim_get_hl(0, { name = "BufferLineCloseButtonVisible" }).fg),
						bg = string.format("#%06x", vim.api.nvim_get_hl(0, { name = "BufferLineCloseButtonVisible" }).bg),
					},
					buffer_selected = {
						fg = string.format("#%06x", vim.api.nvim_get_hl(0, { name = "Normal" }).fg),
						bg = string.format("#%06x", vim.api.nvim_get_hl(0, { name = "BufferLineCloseButtonSelected" }).bg),
						bold = true,
					},
				},
				options = {
					mode = "buffers",
					numbers = "none",
					offsets = {
						{
							filetype = "NvimTree",
							text = "󰉓  NvimTree",
							-- text = function()
							-- 	return vim.fn.fnamemodify(vim.fn.getcwd(), ":~") --(".", ":p:h:t")
							-- end,
							highlight = "BufferLineBufferSelected",
							text_align = "center",
						},
					},
					indicator = { style = "none" },
					separator_style = "thin",
					buffer_close_icon = "✘",
					modified_icon = "",
					close_icon = "✘",
					show_close_icon = true,
					left_trunc_marker = "",
					right_trunc_marker = "",
					max_name_length = 20,
					max_prefix_length = 13,
					tab_size = 20,
					show_tab_indicators = true,
					enforce_regular_tabs = false,
					show_buffer_close_icons = true,
					color_icons = true,
					show_buffer_icons = true,
					diagnostics = false, -- OR: | "nvim_lsp"
					diagnostics_indicator = function(count, level)
						local icon = level:match("error") and "" or ""
						return " " .. icon .. " " .. count
					end,
				},
			})
		end,
	},

	{
		"lualine.nvim",
		event = "DeferredUIEnter",
		after = function()
			require("lualine").setup({
				options = {
					theme = {
						normal = { a = "LuaLineNormalA", b = "LuaLineNormalB", c = "LuaLineNormalC" },
						insert = { a = "LuaLineInsertA" },
						visual = { a = "LuaLineVisualA" },
						replace = { a = "LuaLineReplaceA" },
					},
					icons_enabled = true,
					always_divide_middle = true,
					globalstatus = true,
					component_separators = { left = " ", right = " " },
					section_separators = { right = " ", left = " " },
					disabled_filetypes = {
						statusline = { "alpha", "NvimTree" },
					},
					refresh = {
						statusline = 1000,
					},
				},
				sections = {
					lualine_a = {
						{ "mode", icon = " " },
					},
					lualine_b = {},
					lualine_c = {
						{ "filename", path = 4 },
						{ "branch", icon = "" },
					},
					lualine_x = {
						{
							"diagnostics",
							sources = { "nvim_diagnostic" },
							colored = true,
							symbols = { error = "󰅚 ", warn = " ", info = " ", hint = "󰛩 " },
						},
						"diff",
						{
							"filetype",
							icons_enabled = false,
							fmt = function(str)
								return string.upper(str)
							end,
						},
						{
							function()
								local cur = vim.fn.line('.')
								local total = vim.fn.line('$')
								if cur == 1 then
									return string.format('Top/%d', total)
								elseif cur == total then
									return string.format('Bot/%d', total)
								else
									return string.format('%d/%d', cur, total)
								end
							end
						},
					},
					lualine_y = {},
					lualine_z = {},
				},
				extensions = {
					"fugitive",
					"toggleterm",
					"nvim-tree",
				},
			})
		end,
	},

	{
		"alpha-nvim",
		event = "VimEnter",
		priority = 1000,
		after = function()
			local dashboard = require("alpha.themes.dashboard")
			dashboard.section.header = {
				type = "text",
				val = {
					[[  ██████   █████ █████   █████ █████ ██████   ██████ ]],
					[[ ░░██████ ░░███ ░░███   ░░███ ░░███ ░░██████ ██████  ]],
					[[  ░███░███ ░███  ░███    ░███  ░███  ░███░█████░███  ]],
					[[  ░███░░███░███  ░███    ░███  ░███  ░███░░███ ░███  ]],
					[[  ░███ ░░██████  ░░███   ███   ░███  ░███ ░░░  ░███  ]],
					[[  ░███  ░░█████   ░░░█████░    ░███  ░███      ░███  ]],
					[[  █████  ░░█████    ░░███      █████ █████     █████ ]],
					[[ ░░░░░    ░░░░░      ░░░      ░░░░░ ░░░░░     ░░░░░  ]],
					[[ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ]],
				},
				opts = {
					hl = "Keyword",
					position = "center",
				},
			}

			dashboard.section.buttons = {
				type = "group",
				val = {
					dashboard.button("n f", "  New File", ":ene <BAR> startinsert<CR>"),
					dashboard.button("f f", "  Find File", ":Telescope find_files<CR>"),
					dashboard.button("b k", "  Bookmarks", ":Telescope marks<CR>"),
					dashboard.button("r l", "󰒲  Recent Files", ":Telescope oldfiles<CR>"),
				},
				opts = {
					spacing = 1,
					-- hl_shortcut = "Special",
					position = "center",
				},
			}

			dashboard.section.footer = {
				type = "text",
				val = "Programming isn't about what you know; it's about what you can figure out.",
				opts = {
					hl = "Comment",
					position = "center",
				},
			}

			require("alpha").setup({
				layout = {
					{ type = "padding", val = vim.fn.max({ 2, vim.fn.floor(vim.fn.winheight(0) * 0.33) }) },
					dashboard.section.header,
					{ type = "padding", val = 3 },
					dashboard.section.buttons,
					{ type = "padding", val = 3 },
					dashboard.section.footer,
				},
				opts = {
					margin = 3,
				},
			})
		end,
	},

	{
		"indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		after = function()
			require("ibl").setup({
				indent = {
					char = "┊",
					tab_char = "→",
				},
				scope = {
					enabled = true,
					show_start = false,
					show_end = false,
				},
				whitespace = {
					remove_blankline_trail = true,
				},
				exclude = {
					filetypes = {
						"help",
						"terminal",
						"dashboard",
						"alpha",
						"packer",
						"TelescopePrompt",
						"TelescopeResults",
						"mason",
						"v",
					},
					buftypes = {
						"terminal",
					},
				},
			})
		end,
	},

	{
		"copilot.lua",
		event = "InsertEnter",
		after = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
				server_opts_overrides = {
					offset_encoding = "utf-16",
					settings = {
						telemetry = {
							telemetryLevel = "off",
						},
					},
				},
			})
		end,
	},

	{
		"codecompanion",
		cmd = "CodeCompanion",
		keys = {
			{ "<C-x>", ":CodeCompanionActions<CR>", desc = "AI Code Actions" },
			{ "<C-a>", ":CodeCompanionChat<CR>", desc = "AI Code Chat" },
			{ "<C-ga>", ":CodeCompanionChat Add<CR>", desc = "AI Code Actions" },
		},
		after = function()
			require("codecompanion").setup({
				strategies = {
					chat = {
						adapter = "copilot",
						roles = {
							-- https://github.com/olimorris/codecompanion.nvim/discussions/1094
							llm = function(adapter)
								local model = ""
								if adapter.schema and adapter.schema.model and adapter.schema.model.default then
									model = adapter.schema.model.default
									if type(model) == "function" then
										model = model(adapter)
									end
								end

								return "  " .. adapter.formatted_name .. " (" .. model .. ")"
							end,
							user = "Mahmoud",
						},
					},
					inline = {
						adapter = "copilot",
					},
				},
				display = {
					chat = {
						window = {
							position = "right",
							width = 0.33,
						},
					},
				},
				adapters = {
					copilot = function()
						return require("codecompanion.adapters").extend("copilot", {
							schema = {
								model = {
									default = "gpt-4.1",
								},
							},
						})
					end,
				},
			})
		end,
	},

	{
		"fidget.nvim",
		on_plugin = { "nvim-lspconfig" },
		after = function()
			require("fidget").setup({
				notification = {
					window = {
						normal_hl = "CursorLineNr",
						winblend = 0,
						border = "none",
						align = "bottom",
					},
				},
			})
		end,
	},

	{
		"luasnip",
		on_plugin = { "blink.cmp" },
		after = function()
			local luasnip = require("luasnip")
			luasnip.config.set_config({
				history = true,
				updateevents = "TextChanged,TextChangedI",
				enable_autosnippets = true,
			})
		end,
	},

	{
		"vimtex",
		ft = { "tex", "latex", "bib" },
		after = function()
			vim.g.vimtex_view_method = "zathura"
			vim.g.latex_view_general_viewer = "zathura"
			vim.g.vimtex_syntax_enabled = 1
			vim.g.vimtex_quickfix_enabled = 1
			vim.g.vimtex_quickfix_mode = 1
			vim.g.vimtex_compiler_method = "latexmk"
		end,
	},

	{
		"nvim-lint",
		event = { "BufReadPost", "BufNewFile", "BufWritePost" },
		after = function()
			require("lint").linters_by_ft = {
				zsh = { "shellcheck" },
				sh = { "shellcheck" },
				python = { "ruff" },
				markdown = { "markdownlint" },
				yaml = { "yamllint" },
				dockerfile = { "hadolint" },
				terraform = { "tfsec", "trivy", "terraform_validate", "tflint" },
				tf = { "tfsec", "trivy", "terraform_validate", "tflint" },
				make = { "checkmake" },
				ansible = { "ansible_lint" },
				nix = { "deadnix", "nix", "statix" },
				tex = { "chktex" },
				go = { "golangcilint" },
			}

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = vim.api.nvim_create_augroup("lint", { clear = true }),
				callback = function()
					require("lint").try_lint()
				end,
			})

			vim.api.nvim_create_autocmd("TermOpen", {
				group = vim.api.nvim_create_augroup("NoSpellCheck", { clear = true }),
				callback = function()
					vim.opt_local.spell = false
				end,
			})
		end,
	},

	{
		"conform.nvim",
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format()
				end,
				desc = "Format buffer",
			},
		},
		cmd = { "ConformInfo" },
		after = function()
			require("conform").setup({
				formatters_by_ft = {
					["*"] = { "codespell" },
					["_"] = { "trim_whitespace" },
					lua = { "stylua" },
					python = { "ruff_format", "ruff_fix" },
					json = { "jq" },
					markdown = { "markdownlint" },
					nix = { "nixfmt" },
					bash = { "shfmt" },
					sh = { "shfmt" },
					zsh = { "shfmt" },
					terraform = { "terraform_fmt", "tofu_fmt" },
					tf = { "terraform_fmt", "tofu_fmt" },
					yaml = { "yamlfix" },
					tex = { "latexindent" },
					go = { "gofmt", "goimports-reviser", "golines" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_format = "fallback",
				},
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({
						timeout_ms = 1000,
						async = false,
						lsp_fallback = true,
						bufnr = args.buf,
					})
				end,
			})
		end,
	},

	{
		"blink-pairs",
		on_plugin = { "blink.cmp" },
		after = function()
			require("blink-pairs").setup({
				mappings = {
					enabled = true,
					disabled_filetypes = {},
					pairs = {},
				},
				highlights = {
					enabled = true,
					groups = {
						"BlinkPairsYellow",
						"BlinkPairsPurple",
						"BlinkPairsCyan",
					},
					matchparen = {
						enabled = true,
						group = "BlinkPairsMatchParen",
					},
				},
				debug = false,
			})
		end,
	},

	{
		"nvim-highlight-colors",
		event = "DeferredUIEnter",
		after = function()
			require('nvim-highlight-colors').setup({})
		end,
	},

	{
		"tmux.nvim",
		event = "DeferredUIEnter",
		after = function()
			require("tmux").setup({})
		end,
	},

	{
		"vim-sleuth",
		event = { "BufReadPre", "BufNewFile" },
	},

	{
		"vim-gitgutter",
		event = { "BufRead", "BufNewFile" },
	},

	{
		"vim-nix",
		ft = "nix",
	},

	{
		"vim-terraform",
		ft = { "terraform", "tf" },
	},

	{
		"vim-yaml",
		ft = "yaml",
	},

	{
		"vim-helm",
		ft = "helm",
	},

	{
		"ansible-vim",
		ft = { "ansible", "yaml.ansible" },
	},
})
