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
