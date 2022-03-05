vim.g.nvim_tree_icons = {
	default = '',
	git = {
		unstaged = '',
		staged = '',
		unmerged = '',
		renamed = '',
		untracked = '',
		deleted = '',
	},
}
vim.g.nvim_tree_indent_markers = 1

require'nvim-tree'.setup {
	disable_netrw = true,
	system_open = { cmd = 'open' },
	hijack_cursor = true,
	diagnostics = {
		enable = true,
	},
	view = {
		mappings = {
			custom_only = false,
			list = {
				{key = 'd', action = 'trash'},
				{key = 'D', action = 'remove'},
			}
		}
	}
}
