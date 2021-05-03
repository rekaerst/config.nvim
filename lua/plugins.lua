return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	-- Gruvbox theme
	use 'morhetz/gruvbox'
	-- Intellisense engine for Vim8 & Neovim
	use {'neoclide/coc.nvim', branch= 'release'}
	-- Tree file explorer
	use 'kyazdani42/nvim-web-devicons' -- for file icons
	use 'kyazdani42/nvim-tree.lua'
	-- Onedark theme
	use 'joshdick/onedark.vim'
	-- Adds file type icons to Vim plugins
	use 'ryanoasis/vim-devicons'
	-- lean & mean status/tabline for vim that's light as air
	use 'vim-airline/vim-airline'
	-- quoting/parenthesizing made simple
	use 'tpope/vim-surround'
	-- Parenthesizing plugin
	use 'jiangmiao/auto-pairs'
	--Rainbow Parentheses
	use 'luochen1990/rainbow'
	-- Indent guides
	use 'nathanaelkane/vim-indent-guides'
	-- Fuzzy file, buffer, mru, tag, etc finder.
	use 'ctrlpvim/ctrlp.vim'
	-- Vim plugin that displays tags in a window, ordered by scope
	use 'majutsushi/tagbar'
	-- Multiple cursors plugin for vim/neovim
	use 'mg979/vim-visual-multi'
	-- A plugin for git
	use 'tpope/vim-fugitive'
	-- Advanced syntax highlighting for GNU as
	use 'shirk/vim-gas'
	-- Comment stuff out
	use 'tpope/vim-commentary'
	-- Fizzy
	use 'junegunn/fzf.vim'
	-- html auto pairs
	use 'alvan/vim-closetag'
	-- Mordern database interface for VIM
	use 'tpope/vim-dadbod'
	-- Simple ui for dadbod
	use 'kristijanhusak/vim-dadbod-ui'
	-- DAP
	use 'mfussenegger/nvim-dap'
	-- Semantic highlighting
	use 'nvim-treesitter/nvim-treesitter'
	use 'nvim-treesitter/playground'
end
)
