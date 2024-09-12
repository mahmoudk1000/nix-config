require("nvim-tree").setup({
	auto_close = true,
	hijack_cursor = true,
	disable_netrw = true,
	hijack_netrw = true,
	sync_root_with_cwd = true,
	prefer_startup_root = true,
	respect_buf_cwd = false,
	sort = {
		sorter = "name",
		folders_first = true,
		files_first = false,
	},
	actions = {
		change_dir = { global = true },
		open_file = { quit_on_open = true }
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	renderer = {
		full_name = false,
		add_trailing = false,
		group_empty = false,
		icons = {
			git_placement = "after",
		},
		indent_markers = {
			enable = true,
		},
	},
	filesystem_watchers = {
		enable = true,
	},
	view = {
		width = 35,
		side = "left",
		number = false,
		adaptive_size = true,
		cursorline = true,
		relativenumber = false,
		signcolumn = "yes",
		preserve_window_proportions = true
	},
})
