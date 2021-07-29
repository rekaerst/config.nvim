-- native neovim options
local utils = require('utils')
local opt = utils.opt
local g = vim.g

-- Leader/local leader
g.mapleader = ' '
g.maplocalleader = '\\'

-- neovim remote providers
g.python3_host_prog = '/usr/bin/python3'
g.loaded_python_provider = 0
g.loaded_ruby_provider = 0

-- setttings
opt.number = true
opt.signcolumn = "yes"
opt.mouse = 'a'
opt.wildmode = 'longest:full,full'
opt.termguicolors = true
opt.splitbelow = true
opt.hidden = true
opt.shortmess = vim.o.shortmess .. 'cI'
opt.timeoutlen = 400
opt.inccommand = 'nosplit'
opt.completeopt = 'menuone,noselect'
opt.smartindent = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.lazyredraw = true -- speed up marco
opt.backup = false -- some language servers have issues with backup file
opt.writebackup = false
opt.updatetime = 300 -- having longer updatetime leads to noticeable delays

vim.cmd [[
autocmd TermOpen * setlocal nonumber
]]
---- packer bootstrapping -----
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end
-------------------------------

require('plugin')

-- Colorscheme and highlighting configurations
require('color')

-- LSP (code completion, formating, etc.)
require('lsp')

-- DAP (debugging)
require('dbg')

-- Misc
require('config.misc')

vim.cmd [[
]]
