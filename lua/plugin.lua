local packer = require('packer')
packer.init()
local use = packer.use
packer.reset()

-- Packer
use 'wbthomason/packer.nvim'
use {'nvim-telescope/telescope-packer.nvim', after='telescope.nvim'}

-- Libraries
use {'nvim-lua/plenary.nvim'}
use {'nvim-lua/popup.nvim'}

-- Colorscheme
use {'joshdick/onedark.vim'}

-- Fuzzy
use {'nvim-telescope/telescope.nvim', config='require("config.telescope")'} -- Fizzy
use {'junegunn/fzf'}
use {'junegunn/fzf.vim'}

-- Icons
use {'kyazdani42/nvim-web-devicons'}
use {'ryanoasis/vim-devicons', opt = true}

-- Powerline
use {'vim-airline/vim-airline',config= ' require("config.airline")',opt = true}
use {'hoob3rt/lualine.nvim', config='require("config.lualine")'}

-- Tab bar
use {'romgrk/barbar.nvim', config = 'require("config.barbar")' }

-- Keymapping
use {'folke/which-key.nvim'} -- displays keybindings when typing

-- File explorer
use {'kyazdani42/nvim-tree.lua', config='require("config.tree")'}

-- Parentheses
use {'tpope/vim-surround'} -- quoting/parenthesizing made simple
use {'jiangmiao/auto-pairs'} -- auto pair parentheses
use {'windwp/nvim-autopairs', opt = true}
use {'alvan/vim-closetag'}	-- html auto pairs
use "p00f/nvim-ts-rainbow"	-- rainbow parentheses

-- Indentation tracking
use {'nathanaelkane/vim-indent-guides'}	-- Indent guides

-- Mutli line
use {'mg979/vim-visual-multi'} -- Multiple cursors

-- Highlight colors
use {'RRethy/vim-hexokinase', run = 'make'}

-- Tags
use {'preservim/tagbar', cmd = "Tagbar"}

-- Commenting
use 'tpope/vim-commentary'

-- Undo
use {
	'mbbill/undotree',
	cmd = 'UndotreeToggle',
	config='vim.g.undotree_SetFocusWhenToggle = 1'
}

-- Semantic Highlight
use {'nvim-treesitter/nvim-treesitter',config='require("config.treesitter")',run = ':TSUpdate' }	-- Semantic highlighting
use {'nvim-treesitter/playground', cmd={'TSPlaygroundToggle', 'TSHighlightCapturesUnderCursor'} }

-- Completion
use {'hrsh7th/nvim-compe', config='require("config.compe")'}
use {'nvim-lua/completion-nvim'}

-- LSP
use {'neovim/nvim-lspconfig'}
use {'glepnir/lspsaga.nvim', config='require("config.lspsaga")'}
use {'neoclide/coc.nvim',
	config='require("config.coc")',
	opt=true,
	branch= 'release'
}

-- Debugging
use {'mfussenegger/nvim-dap', config='require("config.dap")'}
use {'nvim-telescope/telescope-dap.nvim', after='telescope.nvim'}

-- Git
use {'tpope/vim-fugitive'} -- A plugin for git
use {'lewis6991/gitsigns.nvim'} -- git side signs

-- Database
use {'tpope/vim-dadbod', cmd = {"DB", "DBUI"}}
use {'kristijanhusak/vim-dadbod-ui', cmd = "DBUI"}

-- Nevim Development
use {'tjdevries/nlua.nvim', opt = true}
use {'rafcamlet/nvim-luapad' , opt = true, cmd = "Luapad"}

-- Utils
use {"dstein64/vim-startuptime"}	-- Profile startup time
