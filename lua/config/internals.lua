local g = vim.g
local utils = require('utils')
local o = utils.opt
vim.cmd [[
autocmd TermOpen * setlocal nonumber
]]

-- Map space to leader
g.mapleader = ' '
g.maplocalleader = '\\'

-- neovim remote providers
g.python3_host_prog = '/usr/bin/python3'
g.loaded_python_provider = 0
g.loaded_ruby_provider = 0

g.rainbow_active = 1
g.indent_guides_enable_on_vim_startup = 1
g.indent_guides_auto_colors = 0
g.rainbow_conf = {
	separately = {
		html = 0
	}
}
g.mkdp_auto_close = 0

o.number = true
o.signcolumn = "yes"
o.mouse = 'a'
o.wildmode = 'longest:full,full'
o.termguicolors = true
o.splitbelow = true
o.hidden = true
o.shortmess = vim.o.shortmess .. 'cI'
o.timeoutlen = 400
o.inccommand = 'nosplit'
o.completeopt = 'menuone,noselect'
o.smartindent = true
o.tabstop = 4
o.shiftwidth = 4
o.lazyredraw = true -- speed up marco
o.backup = false -- some language servers have issues with backup file
o.writebackup = false
o.updatetime = 300 -- having longer updatetime leads to noticeable delays
vim.cmd [[
autocmd TermOpen * setlocal nonumber
]]
