-- native neovim options
vim.wo.number = true -- enable line number
vim.o.number = true -- enable line number
vim.wo.signcolumn = "number"
vim.o.signcolumn = "number"
vim.o.mouse = 'a'
vim.o.wildmode = 'longest:full,full'
vim.o.termguicolors = true
vim.o.splitbelow = true
vim.o.hidden = true
vim.o.shortmess = vim.o.shortmess .. "cI"
vim.o.signcolumn = "number"
vim.o.timeoutlen = 400
vim.o.inccommand = 'nosplit'

vim.o.smartindent = true
vim.bo.smartindent = true
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
