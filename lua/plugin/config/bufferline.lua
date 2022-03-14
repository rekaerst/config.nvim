local colors = require("color.highlight").colors
require("bufferline").setup({
	options = {
		numbers = function(opts)
			return string.format("%s·%s", opts.raise(opts.id), opts.lower(opts.ordinal))
		end,
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
		max_name_length = 20,
		tab_size = 16,
		offsets = {
			{
				filetype = "NvimTree",
				text = "",
				padding = 1,
			},
			{
				filetype = "Outline",
				text = "Outline",
			},
			{
				filetype = "packer",
				text = "Packer",
			},
		},
		buffer_close_icon = "",
		modified_icon = "",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		separator_style = "thin",
	},

	highlights = {
		background = {
			guifg = colors.grey_fg,
			guibg = colors.black2,
		},

		-- buffers
		buffer_selected = {
			guifg = colors.white,
			guibg = colors.black,
			gui = "bold",
		},
		buffer_visible = {
			guifg = colors.light_grey,
			guibg = colors.black2,
		},

		-- for diagnostics = "nvim_lsp"
		error = {
			guifg = colors.light_grey,
			guibg = colors.black2,
		},
		error_diagnostic = {
			guifg = colors.light_grey,
			guibg = colors.black2,
		},

		-- close buttons
		close_button = {
			guifg = colors.light_grey,
			guibg = colors.black2,
		},
		close_button_visible = {
			guifg = colors.light_grey,
			guibg = colors.black2,
		},
		close_button_selected = {
			guifg = colors.red,
			guibg = colors.black,
		},
		fill = {
			guifg = colors.grey_fg,
			guibg = colors.black2,
		},
		indicator_selected = {
			guifg = colors.black,
			guibg = colors.black,
		},

		-- modified
		modified = {
			guifg = colors.red,
			guibg = colors.black2,
		},
		modified_visible = {
			guifg = colors.red,
			guibg = colors.black2,
		},
		modified_selected = {
			guifg = colors.green,
			guibg = colors.black,
		},

		-- separators
		separator = {
			guifg = colors.black2,
			guibg = colors.black2,
		},
		separator_visible = {
			guifg = colors.black2,
			guibg = colors.black2,
		},
		separator_selected = {
			guifg = colors.black2,
			guibg = colors.black2,
		},

		-- tabs
		tab = {
			guifg = colors.light_grey,
			guibg = colors.one_bg3,
		},
		tab_selected = {
			guifg = colors.black2,
			guibg = colors.nord_blue,
		},
		tab_close = {
			guifg = colors.red,
			guibg = colors.black,
		},
	},
})
