local colors = require("color.highlight").colors
local groups = require("bufferline.groups")

require("bufferline").setup({
	options = {
		numbers = function(opts)
			return string.format("%s·%s", opts.raise(opts.id), opts.lower(opts.ordinal))
		end,
		diagnostics = "nvim_lsp",
		---@diagnostic disable-next-line: unused-local
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and " " or " "
			return icon .. count
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
				filetype = "undotree",
				text = "undotree",
			},
			{
				filetype = "packer",
				text = "Packer",
			},
			{
				filetype = "DiffviewFiles",
				text = "Diffview",
			},
		},
		close_icon = "",
		separator_style = "thick",
		groups = {
			options = {
				toggle_hidden_on_enter = true,
			},
			items = {
				groups.builtin.ungrouped,
				{
					name = "Tests",
					highlight = { guisp = colors.blue },
					icon = "",
					matcher = function(buf)
						return buf.filename:match("_test") or buf.filename:match("test")
					end,
				},
				{
					highlight = { guisp = colors.yellow },
					name = "Docs",
					matcher = function(buf)
						for _, ext in ipairs({ "md", "txt", "org", "norg", "wiki" }) do
							if ext == vim.fn.fnamemodify(buf.path, ":e") then
								return true
							end
						end
					end,
				},
			},
		},
	},
	highlights = {
		fill = {
			guibg = colors.light_black,
		},
		tab_selected = {
			guibg = colors.nord_blue,
		},
		tab_close = {
			guifg = colors.red,
		},
		close_button_selected = {
			guifg = colors.red,
		},
		indicator_selected = {
			guifg = colors.nord_blue,
		},
		modified = {
			guifg = colors.red,
		},
		modified_visible = {
			guifg = colors.red,
		},
		modified_selected = {
			guifg = colors.green,
		},
		pick = {
			guifg = colors.green,
		},
	},
})
