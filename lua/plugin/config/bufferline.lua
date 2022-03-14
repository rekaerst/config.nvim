require("bufferline").setup({
	options = {
		numbers = function(opts)
			return string.format("%s·%s", opts.raise(opts.id), opts.lower(opts.ordinal))
		end,
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and " " or " "
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
})
