vim.cmd('packadd termdebug')

return require('packer').startup(function()
	use 'wbthomason/packer.nvim'

	-- LSP and completion
	use {'neoclide/coc.nvim',branch= 'release'}
	use {'neovim/nvim-lspconfig'}
	use {'nvim-lua/completion-nvim'}

	-- Debugging
	use {'mfussenegger/nvim-dap'}
	use {'nvim-telescope/telescope-dap.nvim'}

	-- User Interface
	use {'joshdick/onedark.vim'} -- Onedark theme
	use {'ryanoasis/vim-devicons'}
	use {'vim-airline/vim-airline', opt = true} -- Status line
	use {'hoob3rt/lualine.nvim'}
	use {'romgrk/barbar.nvim'}
	use {'nvim-telescope/telescope.nvim',requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}}	-- Find, Filter, Preview, Pick

	-- File explorer
	use {'kyazdani42/nvim-web-devicons'} -- for file icons
	use {'kyazdani42/nvim-tree.lua'}

	-- Editing Tools
	use {'tpope/vim-surround'} -- quoting/parenthesizing made simple
	use {'jiangmiao/auto-pairs'} -- auto pair parentheses
	use {'nathanaelkane/vim-indent-guides'}	-- Indent guides
	use {'mg979/vim-visual-multi'} -- Multiple cursors

	-- Development tools
	use {'perservim/tagbar', cmd = "Tagbar"} -- displays tags in a window
	use {'shirk/vim-gas', ft = {"s", "asm", "S"} } -- syntax highlighting for GNU as
	use {'tpope/vim-commentary'} -- Comment stuff out
	use {'tpope/vim-dadbod'}	-- Mordern database interface for VIM
	use {'kristijanhusak/vim-dadbod-ui', cmd = "DBUI"}	-- Simple ui for dadbod
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }	-- Semantic highlighting
	use {'nvim-treesitter/playground', cmd={'TSPlaygroundToggle', 'TSHighlightCapturesUnderCursor'} }
	use "p00f/nvim-ts-rainbow"	-- rainbow parentheses
	use {'alvan/vim-closetag'}	-- html auto pairs

	-- Git
	use {'tpope/vim-fugitive'} -- A plugin for git

	-- Utils
	use {"dstein64/vim-startuptime"}	-- Profile startup time
end
)
