local packer = require('packer')
packer.init()
local use = packer.use
packer.reset()

use 'wbthomason/packer.nvim'

-- Libraries
use {'nvim-lua/plenary.nvim'}
use {'nvim-lua/popup.nvim'}

-- User Interface
use {'joshdick/onedark.vim'}

use {'nvim-telescope/telescope.nvim', config='require("config.telescope")'} -- Fizzy
use {'junegunn/fzf'}
use {'junegunn/fzf.vim'}

use {'kyazdani42/nvim-web-devicons'}
use {'ryanoasis/vim-devicons', opt = true}
use {'vim-airline/vim-airline',config= ' require("config.airline")',opt = true}
use {'hoob3rt/lualine.nvim', config='require("config.lualine")'}
use {'romgrk/barbar.nvim', config = 'require("config.barbar")' }
use {'folke/which-key.nvim'} -- displays keybindings when typing

-- File explorer
use {'kyazdani42/nvim-tree.lua', config='require("config.tree")'}

-- Editing
use {'tpope/vim-surround'} -- quoting/parenthesizing made simple
use {'jiangmiao/auto-pairs'} -- auto pair parentheses
use {'alvan/vim-closetag'}	-- html auto pairs
use {'nathanaelkane/vim-indent-guides'}	-- Indent guides
use {'mg979/vim-visual-multi'} -- Multiple cursors
use {'RRethy/vim-hexokinase', run = 'make'}
use {'windwp/nvim-autopairs', opt = true}
use "p00f/nvim-ts-rainbow"	-- rainbow parentheses
use {'nvim-telescope/telescope-packer.nvim'}

-- Development
use {'preservim/tagbar', cmd = "Tagbar"} -- displays tags in a window
use {'shirk/vim-gas', ft = {"s", "asm", "S"} } -- syntax highlighting for GNU as
use {'tpope/vim-commentary'} -- Comment stuff out
use {'tpope/vim-dadbod'}	-- Mordern database interface for VIM
use {'kristijanhusak/vim-dadbod-ui', cmd = "DBUI"}	-- Simple ui for dadbod
use {'nvim-treesitter/nvim-treesitter',config='require("config.treesitter")',run = ':TSUpdate' }	-- Semantic highlighting
use {'nvim-treesitter/playground', cmd={'TSPlaygroundToggle', 'TSHighlightCapturesUnderCursor'} }

-- Completion
use {'hrsh7th/nvim-compe', config='require("config.compe")'}
use {'nvim-lua/completion-nvim'}

-- LSP and completion
use {'neoclide/coc.nvim',config='require("config.coc")',opt=true,branch= 'release'}
use {'neovim/nvim-lspconfig'}
use {'kosayoda/nvim-lightbulb',config='require("config.lightbulb")'}

-- Debugging
use {'mfussenegger/nvim-dap', config='require("config.dap")'}
use {'nvim-telescope/telescope-dap.nvim'}

-- Git
use {'tpope/vim-fugitive'} -- A plugin for git
use {'lewis6991/gitsigns.nvim'} -- git side signs

-- Nevim Development
use {'tjdevries/nlua.nvim', opt = true}
use {'rafcamlet/nvim-luapad' , opt = true, cmd = "Luapad"}

-- Utils
use {"dstein64/vim-startuptime"}	-- Profile startup time
