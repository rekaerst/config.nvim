local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.cmd 'packadd packer.nvim'
end
-------------------------------

require'impatient'
-- Packer
require('plugin')
-- Color scheme and highlighting configurations
require('color')
-- Plugin Configurations
require('config')
-- Keybinding
require('binding').reg_main()
-- LSP (code completion, formatting, etc.)
require('lsp')
-- DAP (debugging)
require('dbg')
