require("lze").load({
	{
		"nvim-treesitter",
		event = "DeferredUIEnter",
		load = function(name)
			require("lzextras").loaders.multi({
				name,
				"nvim-treesitter-textobjects",
				"treesitter-context",
			})
		end,
		after = function(_)
			vim.defer_fn(function()
				vim.api.nvim_create_autocmd("FileType", {
					pattern = {
						"ansible",
						"ansible_hosts",
						"awk",
						"bash",
						"bib",
						"c",
						"cpp",
						"css",
						"dockerfile",
						"go",
						"helm",
						"html",
						"javascript",
						"json",
						"lua",
						"markdown",
						"python",
						"rust",
						"sh",
						"typescript",
						"vim",
						"yaml",
					},
					callback = function()
						vim.treesitter.start()
					end,
				})

				require("nvim-treesitter-textobjects").setup({
					select = {
						lookahead = true,
					},
					move = {
						set_jumps = true,
					},
				})

				-- Text object selections
				vim.keymap.set(
					{ "x", "o" },
					"aa",
					"<cmd>lua require('nvim-treesitter.textobjects.select').select_textobject('@parameter.outer', 'textobjects')<cr>",
					{ desc = "Select around parameter" }
				)
				vim.keymap.set(
					{ "x", "o" },
					"ia",
					"<cmd>lua require('nvim-treesitter.textobjects.select').select_textobject('@parameter.inner', 'textobjects')<cr>",
					{ desc = "Select inner parameter" }
				)
				vim.keymap.set(
					{ "x", "o" },
					"af",
					"<cmd>lua require('nvim-treesitter.textobjects.select').select_textobject('@function.outer', 'textobjects')<cr>",
					{ desc = "Select around function" }
				)
				vim.keymap.set(
					{ "x", "o" },
					"if",
					"<cmd>lua require('nvim-treesitter.textobjects.select').select_textobject('@function.inner', 'textobjects')<cr>",
					{ desc = "Select inner function" }
				)
				vim.keymap.set(
					{ "x", "o" },
					"ac",
					"<cmd>lua require('nvim-treesitter.textobjects.select').select_textobject('@class.outer', 'textobjects')<cr>",
					{ desc = "Select around class" }
				)
				vim.keymap.set(
					{ "x", "o" },
					"ic",
					"<cmd>lua require('nvim-treesitter.textobjects.select').select_textobject('@class.inner', 'textobjects')<cr>",
					{ desc = "Select inner class" }
				)

				-- Movement keymaps
				vim.keymap.set({ "n", "x", "o" }, "]m", function()
					require("nvim-treesitter.textobjects.move").goto_next_start("@function.outer")
				end, { desc = "Next function start" })
				vim.keymap.set({ "n", "x", "o" }, "]]", function()
					require("nvim-treesitter.textobjects.move").goto_next_start("@class.outer")
				end, { desc = "Next class start" })
				vim.keymap.set({ "n", "x", "o" }, "]M", function()
					require("nvim-treesitter.textobjects.move").goto_next_end("@function.outer")
				end, { desc = "Next function end" })
				vim.keymap.set({ "n", "x", "o" }, "][", function()
					require("nvim-treesitter.textobjects.move").goto_next_end("@class.outer")
				end, { desc = "Next class end" })
				vim.keymap.set({ "n", "x", "o" }, "[m", function()
					require("nvim-treesitter.textobjects.move").goto_previous_start("@function.outer")
				end, { desc = "Previous function start" })
				vim.keymap.set({ "n", "x", "o" }, "[[", function()
					require("nvim-treesitter.textobjects.move").goto_previous_start("@class.outer")
				end, { desc = "Previous class start" })
				vim.keymap.set({ "n", "x", "o" }, "[M", function()
					require("nvim-treesitter.textobjects.move").goto_previous_end("@function.outer")
				end, { desc = "Previous function end" })
				vim.keymap.set({ "n", "x", "o" }, "[]", function()
					require("nvim-treesitter.textobjects.move").goto_previous_end("@class.outer")
				end, { desc = "Previous class end" })

				-- Swap parameters
				vim.keymap.set("n", "<leader>a", function()
					require("nvim-treesitter.textobjects.swap").swap_next("@parameter.inner")
				end, { desc = "Swap parameter with next" })
				vim.keymap.set("n", "<leader>A", function()
					require("nvim-treesitter.textobjects.swap").swap_previous("@parameter.inner")
				end, { desc = "Swap parameter with previous" })

				-- Incremental selection
				vim.keymap.set("n", "gnn", function()
					require("nvim-treesitter.incremental_selection").init_selection()
				end, { desc = "Init treesitter selection" })
				vim.keymap.set("x", "grn", function()
					require("nvim-treesitter.incremental_selection").node_incremental()
				end, { desc = "Increment node selection" })
				vim.keymap.set("x", "grm", function()
					require("nvim-treesitter.incremental_selection").node_decremental()
				end, { desc = "Decrement node selection" })
				vim.keymap.set("x", "grc", function()
					require("nvim-treesitter.incremental_selection").scope_incremental()
				end, { desc = "Increment scope selection" })
			end, 0)
		end,
	},
})
