local util = require('util')
vim.cmd('syntax enable')
vim.cmd('colorscheme onedark')

-- Indent guide
vim.cmd("autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#3B374A ctermbg=3")
vim.cmd("autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#2E3F49 ctermbg=4")

-- Highlight on yank
vim.cmd('au TextYankPost * silent! lua vim.highlight.on_yank()')

-- semantic highlight
if vim.g.colors_name == "onedark" then
	util.hi('TSKeyword', '#C678DD')
	util.hi('TSParameter', '#ABB2BF')
	util.hi('TSConstructor', '#E5C07B')
	util.hi('TSInclude', '#C678DD')
	util.hi('TSFuncMacro', '#61AFEF')
	util.hi('TSFuncBuiltin', '#56B6C2')
	util.hi('pythonTSVariableBuiltin', '#E5C07B')
end

