vim.cmd('packadd termdebug')

-- bootstrapping code
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({'git', 'clone', '--depth 1', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- Libraries
	use {'nvim-lua/plenary.nvim'}
	use {'nvim-lua/popup.nvim'}

	-- User Interface
	use {'joshdick/onedark.vim'}

	use {'nvim-telescope/telescope.nvim'} -- Fizzy
	use {'junegunn/fzf'}
	use {'junegunn/fzf.vim'}

	use {'kyazdani42/nvim-web-devicons'}
	use {'ryanoasis/vim-devicons', opt = true}
	use {'vim-airline/vim-airline', opt = true}
	use {'hoob3rt/lualine.nvim'}
	use {'romgrk/barbar.nvim'}
	use {'folke/which-key.nvim'} -- displays keybindings when typing

	-- File explorer
	use {'kyazdani42/nvim-tree.lua'}

	-- Editing
	use {'tpope/vim-surround'} -- quoting/parenthesizing made simple
	use {'jiangmiao/auto-pairs'} -- auto pair parentheses
	use {'nathanaelkane/vim-indent-guides'}	-- Indent guides
	use {'mg979/vim-visual-multi'} -- Multiple cursors
	use {'RRethy/vim-hexokinase', run = 'make'}

	-- Development
	use {'preservim/tagbar', cmd = "Tagbar"} -- displays tags in a window
	use {'shirk/vim-gas', ft = {"s", "asm", "S"} } -- syntax highlighting for GNU as
	use {'tpope/vim-commentary'} -- Comment stuff out
	use {'tpope/vim-dadbod'}	-- Mordern database interface for VIM
	use {'kristijanhusak/vim-dadbod-ui', cmd = "DBUI"}	-- Simple ui for dadbod
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }	-- Semantic highlighting
	use {'nvim-treesitter/playground', cmd={'TSPlaygroundToggle', 'TSHighlightCapturesUnderCursor'} }
	use "p00f/nvim-ts-rainbow"	-- rainbow parentheses
	use {'alvan/vim-closetag'}	-- html auto pairs

	-- LSP and completion
	use {'neoclide/coc.nvim',branch= 'release'}
	use {'neovim/nvim-lspconfig'}
	use {'nvim-lua/completion-nvim'}

	-- Debugging
	use {'mfussenegger/nvim-dap'}
	use {'nvim-telescope/telescope-dap.nvim'}

	-- Git
	use {'tpope/vim-fugitive'} -- A plugin for git
	use {'lewis6991/gitsigns.nvim'} -- git side signs

	-- Nevim Development
	use {'tjdevries/nlua.nvim', opt = true}
	use {'rafcamlet/nvim-luapad' , opt = true, cmd = "Luapad"}

	-- Utils
	use {"dstein64/vim-startuptime"}	-- Profile startup time
end
)
