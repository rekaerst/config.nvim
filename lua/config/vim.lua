-- native neovim options
vim.wo.number = true
vim.o.number = true
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

-- enable lazyredraw to speedup marcos
vim.o.lazyredraw = true

-- nvim providers
vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0

-- for lsp
vim.o.backup = false -- some language servers have issues with backup file
vim.o.writebackup = false
vim.o.updatetime = 300 -- having longer updatetime leads to noticeable delays
