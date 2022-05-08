require("indent_blankline").setup({
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

vim.cmd([[
highlight IndentBlanklineIndent1  guifg=#807560 guibg=#242830 gui=nocombine
highlight IndentBlanklineIndent2  guifg=#6b8060 guibg=#2c2430 gui=nocombine
highlight IndentBlanklineIndent3  guifg=#608075 guibg=#302428 gui=nocombine
highlight IndentBlanklineIndent4  guifg=#606b80 guibg=#302c24 gui=nocombine
highlight IndentBlanklineIndent5  guifg=#756080 guibg=#283024 gui=nocombine
highlight IndentBlanklineIndent6  guifg=#80606b guibg=#24302c gui=nocombine

highlight IndentBlanklineContextChar guifg=#ffca66
highlight IndentBlanklineContextStart guisp=#ffca66 gui=underline
]])
