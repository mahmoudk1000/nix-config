require("lze").load({
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
		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
		after = function()
			require("conform").setup({
				formatters = {
					yamlfix = {
						env = {
							YAMLFIX_SEQUENCE_STYLE = "block_style",
						},
					},
				},
				formatters_by_ft = {
					["*"] = { "codespell" },
					["_"] = { "trim_whitespace" },
					bash = { "shfmt" },
					css = { "biome" },
					go = { "gofmt", "goimports-reviser", "golines" },
					html = { "biome" },
					javascript = { "biome" },
					javascriptreact = { "biome" },
					json = { "jq" },
					lua = { "stylua" },
					markdown = { "markdownlint" },
					nix = { "nixfmt" },
					python = { "ruff_format", "ruff_fix" },
					sh = { "shfmt" },
					terraform = { "terraform_fmt", "tofu_fmt" },
					tex = { "latexindent" },
					tf = { "terraform_fmt", "tofu_fmt" },
					typescript = { "biome" },
					typescriptreact = { "biome" },
					yaml = { "yamlfix" },
					zsh = { "shfmt" },
				},
				format_on_save = {
					timeout_ms = 1000,
					lsp_format = "fallback",
				},
			})
		end,
	},
})
