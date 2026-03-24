require("lze").load({
	{
		"nvim-lint",
		event = { "BufReadPost", "BufNewFile", "BufWritePost" },
		after = function()
			require("lint").linters_by_ft = {
				ansible = { "ansible_lint" },
				css = { "biomejs" },
				dockerfile = { "hadolint" },
				go = { "golangcilint" },
				javascript = { "biomejs" },
				javascriptreact = { "biomejs" },
				make = { "checkmake" },
				markdown = { "markdownlint" },
				nix = { "deadnix", "nix", "statix" },
				python = { "ruff" },
				sh = { "shellcheck" },
				terraform = { "tfsec", "trivy", "terraform_validate", "tflint" },
				tex = { "chktex" },
				tf = { "tfsec", "trivy", "terraform_validate", "tflint" },
				typescript = { "biomejs" },
				typescriptreact = { "biomejs" },
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
