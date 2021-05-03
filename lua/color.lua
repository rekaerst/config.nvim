vim.cmd('syntax enable')
vim.cmd('colorscheme onedark')

vim.cmd("autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#3B374A ctermbg=3")
vim.cmd("autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#2E3F49 ctermbg=4")

vim.cmd("hi TSVariable guifg=#EF596F")
-- Highlight on yank
vim.cmd('au TextYankPost * silent! lua vim.highlight.on_yank()')
