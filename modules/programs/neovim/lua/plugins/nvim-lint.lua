require("lze").load({
	{
		"nvim-lint",
		event = { "BufReadPost", "BufNewFile", "BufWritePost" },
		after = function()
			require("lint").linters_by_ft = {
				ansible = { "ansible_lint" },
				css = { "biome" },
				dockerfile = { "hadolint" },
				go = { "golangcilint" },
				javascript = { "biome" },
				javascriptreact = { "biome" },
				make = { "checkmake" },
				markdown = { "markdownlint" },
				nix = { "deadnix", "nix", "statix" },
				python = { "ruff" },
				sh = { "shellcheck" },
				terraform = { "tfsec", "trivy", "terraform_validate", "tflint" },
				tex = { "chktex" },
				tf = { "tfsec", "trivy", "terraform_validate", "tflint" },
				typescript = { "biome" },
				typescriptreact = { "biome" },
				yaml = { "yamllint" },
				zsh = { "shellcheck" },
			}

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = vim.api.nvim_create_augroup("lint", { clear = true }),
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
})
