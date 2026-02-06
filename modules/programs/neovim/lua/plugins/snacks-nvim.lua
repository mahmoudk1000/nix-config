require("lze").load({
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
})
