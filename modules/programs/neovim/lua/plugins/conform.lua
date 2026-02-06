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
		cmd = { "ConformInfo" },
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
})
