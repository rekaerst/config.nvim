local g = vim.g

g.nvim_tree_icons = {
	default = "",
	git = {
		deleted = "",
		ignored = "◌",
		renamed = "➜",
		staged = "✓",
		unmerged = "",
		unstaged = "✗",
		untracked = "★",
	},
}

require("nvim-tree").setup({
	disable_netrw = true,
	indent_markers = 1,
	add_trailing = 0,
	system_open = { cmd = "open" },
	hijack_cursor = true,
	diagnostics = {
		enable = true,
	},
	view = {
		mappings = {
			custom_only = false,
			list = {
				{ key = "d", action = "trash" },
				{ key = "D", action = "remove" },
			},
		},
		allow_resize = true,
		hide_root_folder = true,
	},
	actions = {
		open_file = {
			resize_window = true,
		},
	},
})
