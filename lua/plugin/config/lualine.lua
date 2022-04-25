local colors = require("color.highlight").colors

local diffview_ext = {
	sections = {
		lualine_a = {
			function()
				return "DiffView"
			end,
		},
	},
	filetypes = { "DiffviewFiles" },
}

local help_ext = {
	sections = {
		lualine_a = {
			function()
				return "Help"
			end,
		},
		lualine_y = {
			function()
				return vim.api.nvim_buf_line_count(0)
			end,
		},
		lualine_z = { "progress" },
	},
	filetypes = { "help" },
}

require("lualine").setup({
	options = {
		theme = {
			normal = {
				a = { bg = colors.green, fg = colors.black, gui = "bold" },
				b = { bg = colors.one_bg2, fg = colors.white },
				c = { bg = colors.statusline_bg, fg = colors.light_grey },
			},
			insert = {
				a = { bg = colors.blue, fg = colors.black, gui = "bold" },
			},
			visual = {
				a = { bg = colors.dark_purple, fg = colors.black, gui = "bold" },
			},
			replace = {
				a = { bg = colors.red, fg = colors.black, gui = "bold" },
			},
			command = {
				a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
			},
			inactive = {
				a = { bg = colors.one_bg2, fg = colors.white },
			},
		},
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { "location" },
	},
	extensions = { "nvim-tree", "toggleterm", "symbols-outline", "quickfix", diffview_ext, help_ext },
})
