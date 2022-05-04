local g = vim.g

g.nvim_tree_git_hl = 1
g.nvim_tree_group_empty = 1

require("nvim-tree").setup({
	disable_netrw = true,
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
		hide_root_folder = true,
	},
	actions = {
		open_file = {
			resize_window = true,
		},
	},
})
