require("bufferline").setup({
	options = {
		numbers = function(opts)
			return string.format("%s·%s", opts.raise(opts.id), opts.lower(opts.ordinal))
		end,
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
		max_name_length = 20,
		tab_size = 16,
		offsets = {
			{
				filetype = "NvimTree",
				text = "Files",
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
	},
})
