local util = require('util')
vim.cmd('syntax enable')
vim.cmd('colorscheme onedark')

vim.cmd("autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#3B374A ctermbg=3")
vim.cmd("autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#2E3F49 ctermbg=4")

-- semantic highlight
util.hi('Keyword', '#C678DD')
util.hi('TSParameter', '#ABB2BF')
util.hi('TSConstructor', '#E5C07B')
util.hi('TSInclude', '#C678DD')
util.hi('TSFuncMacro', '#61AFEF')
util.hi('TSFuncBuiltin', '#4281EF')
util.hi('pythonTSVariableBuiltin', '#E5C07B')

-- Highlight on yank
vim.cmd('au TextYankPost * silent! lua vim.highlight.on_yank()')
