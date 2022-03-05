vim.cmd [[highlight IndentBlanklineIndent1 guibg=#3a323a gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#3b3b3b gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guibg=#333b3b gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guibg=#2d3a42 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guibg=#293858 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guibg=#373345 gui=nocombine]]

require("indent_blankline").setup {
	char = "",
	char_highlight_list = {"IndentBlanklineIndent1", "IndentBlanklineIndent2", "IndentBlanklineIndent3",
                        "IndentBlanklineIndent4", "IndentBlanklineIndent5", "IndentBlanklineIndent6"},
	space_char_highlight_list = {"IndentBlanklineIndent1", "IndentBlanklineIndent2", "IndentBlanklineIndent3",
                              "IndentBlanklineIndent4", "IndentBlanklineIndent5", "IndentBlanklineIndent6"},
	show_trailing_blankline_indent = false,
	filetype_exclude = {'NvimTree'}
}
