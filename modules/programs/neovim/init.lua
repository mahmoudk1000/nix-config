-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	group = highlight_group,
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Options
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

-- Search
vim.o.hlsearch = true
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

-- Splits
vim.o.splitbelow = true
vim.o.splitright = true

-- Clipboard
vim.o.clipboard = "unnamedplus"

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
vim.o.completeopt = "menu,preview,noselect"

-- Encoding
vim.o.encoding = "utf-8"

-- Folding
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
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

-- Color Scheme
vim.cmd.colorscheme("islet")

-- Disable space in normal and visual mode (since it's our leader)
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

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
vim.keymap.set("n", "<leader>c", "gcc", { remap = true, silent = true, desc = "[C]omment Line" })
vim.keymap.set("v", "<leader>/", "gc", { remap = true, silent = true, desc = "[C]omment Selection" })

-- helpers for dealing with other people's code
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
	},
	filename = {
		["Jenkinsfile"] = "groovy",
		["kubeconfig"] = "yaml",
	},
	pattern = {
		["Dockerfile[^/]*"] = "dockerfile",
		["docker%-compose%.y.?ml"] = "yaml.docker-compose",
		[".*/templates/.*%.yaml"] = "helm",
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
					use_nvim_cmp_as_default = true,
					nerd_font_variant = "mono",
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
					trigger = {
						show_on_trigger_character = true,
						show_on_insert_on_trigger_character = true,
						show_on_x_blocked_trigger_characters = { "'", '"', "(", "{" },
					},
					menu = {
						min_width = 20,
						auto_show = true,
						border = "rounded",
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
						draw = {
							columns = {
								{ "label", "label_description", gap = 1 },
								{ "kind_icon", "kind", gap = 1 },
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
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},

	{
		"incline.nvim",
		event = { "DeferredUIEnter" },
		after = function(_)
			require("incline").setup({
				highlight = {
					groups = {
						InclineNormal = { default = true, group = "lualine_b_normal" },
						InclineNormalNC = { default = true, group = "lualine_b_normal" },
					},
				},
				window = { margin = { vertical = 0, horizontal = 1 } },
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					local icon, color = require("nvim-web-devicons").get_icon_color(filename)
					return { { icon, guifg = color }, { icon and " " or "" }, { filename } }
				end,
				hide = {
					cursorline = false,
					focused_win = false,
					only_win = true,
				},
			})
		end,
	},

	{
		"nvim-lspconfig",
		priority = 90,
		on_require = { "lspconfig" },
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
				virtual_text = true,
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
		"sqls",
		lsp = {
			filetypes = { "sql", "mysql" },
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
			filetypes = { "yaml", "yml" },
			before_init = function(_, config)
				local k8s = require("k8s-schemas")
				config.settings.yaml.schemas = config.settings.yaml.schemas or {}
				if k8s.isKubernetesResource() then
					config.settings.yaml.customTags = {}
					config.settings.yaml.schemas =
						vim.tbl_extend("force", k8s.buildScheme(), config.settings.yaml.schemas)
				end
			end,
			settings = {
				redhat = {
					telemetry = { enabled = false },
				},
				yaml = {
					validate = true,
					hover = true,
					completion = true,
					schemaStore = {
						enable = false,
						url = "",
					},
					schemas = {
						["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.{yaml,yml}",
						["https://json.schemastore.org/github-action.json"] = ".github/action.{yaml,yml}",
						["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yaml,yml}",
						["https://json.schemastore.org/ansible-playbook.json"] = "*play*.{yaml,yml}",
						["https://json.schemastore.org/chart.json"] = "Chart.{yaml,yml}",
						["https://json.schemastore.org/kustomization.json"] = "kustomization.{yaml,yml}",
						["https://json.schemastore.org/dependabot-v2.json"] = ".github/dependabot.{yaml,yml}",
						["https://json.schemastore.org/gitlab-ci.json"] = "*gitlab-ci*.{yaml,yml}",
						["https://json.schemastore.org/prettierrc.json"] = ".prettierrc.{yaml,yml}",
						["https://json.schemastore.org/ansible-stable-2.9.json"] = "roles/tasks/*.{yaml,yml}",
					},
					customTags = {
						"!Ref",
						"!Condition",
						"!GetAtt",
						"!Join",
						"!Select",
						"!Split",
						"!Sub",
						"!Base64",
						"!GetAZs",
						"!ImportValue",
						"!FindInMap",
						"!Equals",
						"!If",
						"!And",
						"!Or",
						"!Not",
					},
					suggest = {
						parentSkeletonSelectedFirst = true,
					},
					format = {
						enable = true,
						singleQuote = false,
						bracketSpacing = true,
						proseWrap = "preserve",
						printWidth = 120,
					},
				},
			},
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
		"nil_ls",
		lsp = {
			filetypes = { "nix" },
			root_markers = { "flake.nix", ".git" },
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
		load = function(name)
			require("lzextras").loaders.multi({
				name,
				"nvim-treesitter-textobjects",
			})
		end,
		after = function()
			vim.defer_fn(function()
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
					textobjects = {
						select = {
							enable = true,
							lookahead = true,
							keymaps = {
								["aa"] = "@parameter.outer",
								["ia"] = "@parameter.inner",
								["af"] = "@function.outer",
								["if"] = "@function.inner",
								["ac"] = "@class.outer",
								["ic"] = "@class.inner",
							},
						},
						move = {
							enable = true,
							set_jumps = true,
							goto_next_start = {
								["]m"] = "@function.outer",
								["]]"] = "@class.outer",
							},
							goto_next_end = {
								["]M"] = "@function.outer",
								["]["] = "@class.outer",
							},
							goto_previous_start = {
								["[m"] = "@function.outer",
								["[["] = "@class.outer",
							},
							goto_previous_end = {
								["[M"] = "@function.outer",
								["[]"] = "@class.outer",
							},
						},
						swap = {
							enable = true,
							swap_next = {
								["<leader>a"] = "@parameter.inner",
							},
							swap_previous = {
								["<leader>A"] = "@parameter.inner",
							},
						},
					},
				})
			end, 0)
		end,
	},

	{
		"nvim-web-devicons",
		on_require = "nvim-web-devicons",
		after = function()
			require("nvim-web-devicons").setup({})
		end,
	},

	{
		"snacks.nvim",
		priority = 1000,
		lazy = false,
		keys = {
			{
				"<A-t>",
				function()
					require("snacks").terminal()
				end,
				mode = { "n", "t" },
				desc = "Toggle Terminal",
			},
			{
				"<A-f>",
				function()
					require("snacks").terminal(nil, { win = { position = "float", height = 0.8 } })
				end,
				mode = { "n", "t" },
				desc = "Toggle [F]loating Terminal",
			},
			{
				"<C-n>",
				function()
					require("snacks").picker.explorer()
				end,
				desc = "Toggle File Explorer",
			},
			{
				"<leader>/",
				function()
					require("snacks").picker.lines()
				end,
				desc = "[/] Fuzzily Search in Current Buffer",
			},
			{
				"<leader>sf",
				function()
					require("snacks").picker.files()
				end,
				desc = "[s]earch [f]iles",
			},
			{
				"<leader>sh",
				function()
					require("snacks").picker.help()
				end,
				desc = "[s]earch [h]elp",
			},
			{
				"<leader>sw",
				function()
					require("snacks").picker.grep_word()
				end,
				desc = "[s]earch [w]ord",
			},
			{
				"<leader>sg",
				function()
					require("snacks").picker.grep()
				end,
				desc = "[s]earch by [g]rep",
			},
			{
				"<leader>gc",
				function()
					require("snacks").picker.git_log()
				end,
				desc = "[g]it [c]omits",
			},
			{
				"<leader>gs",
				function()
					require("snacks").picker.git_status()
				end,
				desc = "[g]it [s]tatus",
			},
			{
				"<leader>sb",
				function()
					require("snacks").picker.buffers()
				end,
				desc = "[s]earch [b]buffers",
			},
			{
				"<leader>sd",
				function()
					require("snacks").picker.diagnostics()
				end,
				desc = "[s]earch [d]iagnostics",
			},
			{
				"<leader>sD",
				function()
					require("snacks").picker.diagnostics_buffer()
				end,
				desc = "[s]earch Buffer [D]iagnostics",
			},
			{
				"<leader>gB",
				function()
					require("snacks").gitbrowse()
				end,
				desc = "[g]it [B]rowse",
			},
			{
				"<leader>gb",
				function()
					require("snacks.git").blame_line()
				end,
				desc = "[g]it [b]lame Line",
			},
		},
		after = function()
			require("snacks").setup({
				bigfile = { enabled = true },
				quickfile = { enabled = true },
				statuscolumn = {
					enabled = true,
					left = { "mark", "sign" },
					right = { "fold", "git" },
					git = {
						patterns = { "GitSign", "MiniDiffSign" },
					},
				},
				input = { enabled = true },
				terminal = {
					enabled = true,
					win = {
						position = "bottom",
						height = 0.4,
						border = "rounded",
					},
				},
				explorer = {
					enabled = true,
					width = 35,
					focus = "list",
					auto_close = false,
					tree = true,
					diagnostics = true,
					git_status = true,
					follow_file = true,
				},
				picker = {
					enabled = true,
					win = {
						input = {
							keys = {
								["<C-u>"] = { "list_scroll_up", mode = { "i", "n" } },
								["<C-d>"] = { "list_scroll_down", mode = { "i", "n" } },
							},
						},
					},
					sources = {
						explorer = {
							layout = { preset = "sidebar", preview = false },
							formatters = {
								file = { filename_only = false },
							},
						},
					},
				},
				indent = {
					enabled = true,
					indent = {
						char = "┊",
						only_scope = false,
						only_current = false,
					},
					scope = {
						enabled = true,
						char = "┊",
					},
				},
				git = {
					enabled = true,
				},
				gitbrowse = {
					enabled = true,
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
								local cur = vim.fn.line(".")
								local total = vim.fn.line("$")
								if cur == 1 then
									return string.format("Top/%d", total)
								elseif cur == total then
									return string.format("Bot/%d", total)
								else
									return string.format("%d/%d", cur, total)
								end
							end,
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
					http = {
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
			require("nvim-highlight-colors").setup({})
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
