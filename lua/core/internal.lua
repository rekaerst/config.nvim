local g = vim.g
local o = vim.opt
local autocmd = vim.api.nvim_create_autocmd

local M = {}

local function ft_config()
	autocmd("TermOpen", { command = "setlocal nonumber" })
	-- expandtab
	autocmd("FileType", {
		pattern = { "python", "markdown" },
		command = "set expandtab",
	})
	-- tabsize = 2
	autocmd("FileType", {
		pattern = { "markdown", "css" },
		command = "set tabstop=2 | set shiftwidth=2",
	})
	-- tabsize = 8
	autocmd("FileType", {
		pattern = { "nasm" },
		command = "set tabstop=8 | set shiftwidth=8",
	})
	-- force filetype
	autocmd({ "BufNew", "BufNewFile", "BufRead" }, {
		pattern = { "*.s", "*.S", "*.asm", "*.ASM" },
		command = "set ft=nasm",
	})
end

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
	o.termguicolors = true
	o.title = true

	o.completeopt = "menuone,noselect"
	o.wildmode = "longest:full,full"
	o.shortmess = vim.o.shortmess .. "cI"

	o.cursorline = true
	o.cursorlineopt = "number"
	o.number = true
	o.signcolumn = "yes"
	o.mouse = "a"

	o.shiftwidth = 4
	o.tabstop = 4
	o.smartindent = true

	o.lazyredraw = true -- speed up marco

	o.splitbelow = true

	o.timeoutlen = 400
	o.updatetime = 300 -- having longer updatetime leads to noticeable delays

	o.writebackup = false
	o.backup = false -- some language servers have issues with backup file
	ft_config()
end

return M
