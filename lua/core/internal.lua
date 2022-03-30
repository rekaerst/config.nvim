local g = vim.g
local o = vim.opt
vim.cmd([[
autocmd TermOpen * setlocal nonumber
]])

-- Map space to leader
g.mapleader = " "
g.maplocalleader = "\\"

-- neovim remote providers
g.python3_host_prog = "/usr/bin/python3"
g.loaded_python_provider = 0
g.loaded_ruby_provider = 0

-- config
o.backup = false -- some language servers have issues with backup file
o.completeopt = "menuone,noselect"
o.cursorline = true
o.cursorlineopt = "number"
o.inccommand = "nosplit"
o.lazyredraw = true -- speed up marco
o.mouse = "a"
o.number = true
o.shiftwidth = 4
o.shortmess = vim.o.shortmess .. "cI"
o.signcolumn = "yes"
o.smartindent = true
o.splitbelow = true
o.tabstop = 4
o.termguicolors = true
o.timeoutlen = 400
o.updatetime = 300 -- having longer updatetime leads to noticeable delays
o.wildmode = "longest:full,full"
o.writebackup = false

vim.cmd([[
autocmd TermOpen * setlocal nonumber
au FileType python set expandtab
au FileType markdown set expandtab | set tabstop=2 | set shiftwidth=2
au FileType nasm set tabstop=8 | set shiftwidth=8 | set expandtab
au BufNew,BufNewFile,BufRead *.tex :set ft=markdown
au BufNew,BufNewFile,BufRead *.s,*.S,*.asm,*.ASM :set ft=nasm
]])
