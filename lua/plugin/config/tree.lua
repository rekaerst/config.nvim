require("nvim-tree").setup({
	disable_netrw = true,
	system_open = { cmd = "open" },
	hijack_cursor = true,
	respect_buf_cwd = true,
	update_cwd = true,
	view = {
		hide_root_folder = true,
		mappings = {
			custom_only = false,
			list = {
				{ key = "d", action = "trash" },
				{ key = "D", action = "remove" },
				{ key = "<C-s>", action = "split" },
			},
		},
	},
	renderer = {
		indent_markers = {
			enable = true,
		},
		icons = {
			git_placement = "after",
		},
		highlight_git = true,
		group_empty = true,
	},
	diagnostics = {
		enable = true,
	},
})
