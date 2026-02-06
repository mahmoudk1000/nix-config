require("lze").load({
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
