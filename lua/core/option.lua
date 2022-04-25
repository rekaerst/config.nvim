local g = vim.g
local opt = vim.opt

local M = {}

function M.setup()
	-- Map space to leader
	g.mapleader = " "
	g.maplocalleader = "\\"

	-- neovim remote providers
	g.python3_host_prog = "/usr/bin/python3"
	g.loaded_python_provider = 0
	g.loaded_ruby_provider = 0
	g.loaded_perl_provider = 0

	-- config
	opt.termguicolors = true
	opt.title = true
	opt.colorcolumn = "80"

	opt.completeopt = "menuone,noselect"
	opt.wildmode = "longest:full,full"
	opt.shortmess = vim.o.shortmess .. "cI"

	opt.cursorline = true
	opt.cursorlineopt = "number"
	opt.number = true
	opt.signcolumn = "yes"
	opt.mouse = "a"

	opt.shiftwidth = 4
	opt.tabstop = 4
	opt.softtabstop = 4
	opt.smartindent = true

	opt.lazyredraw = true -- speed up marco

	opt.splitbelow = true

	opt.timeoutlen = 400
	opt.updatetime = 300 -- having longer updatetime leads to noticeable delays

	opt.writebackup = false
	opt.backup = false -- some language servers have issues with backup file
end

return M
