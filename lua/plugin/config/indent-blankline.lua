vim.cmd([[
highlight IndentBlanklineIndent1 guibg=#3a323a gui=nocombine
highlight IndentBlanklineIndent2 guibg=#3b3b3b gui=nocombine
highlight IndentBlanklineIndent3 guibg=#333b3b gui=nocombine
highlight IndentBlanklineIndent4 guibg=#2d3a42 gui=nocombine
highlight IndentBlanklineIndent5 guibg=#293858 gui=nocombine
highlight IndentBlanklineIndent6 guibg=#373345 gui=nocombine
]])

require("indent_blankline").setup({
	char = "",
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
	},
	space_char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
	},
	show_trailing_blankline_indent = false,
	filetype_exclude = { "NvimTree", "help", "packer", "checkhealth" },
	show_current_context = true,
	show_current_context_start = true,
})
