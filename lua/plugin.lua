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
use {'folke/tokyonight.nvim'}
use {'Th3Whit3Wolf/one-nvim'}
use {'sainnhe/edge'}

-- Fuzzy
use {'nvim-telescope/telescope.nvim', config='require("config.telescope")'} -- Fizzy
use {'junegunn/fzf'}
use {'junegunn/fzf.vim'}

-- Icons
use {'kyazdani42/nvim-web-devicons'}
use {'ryanoasis/vim-devicons', opt = true}

-- Powerline
use {'hoob3rt/lualine.nvim', config='require("config.lualine")'}

-- Tab bar
use {'romgrk/barbar.nvim', config = 'require("config.barbar")' }

-- Keymapping
use {'folke/which-key.nvim'} -- displays keybindings when typing

-- File explorer
use {'kyazdani42/nvim-tree.lua', config='require("config.tree")'}

-- Parentheses
use {'tpope/vim-surround'} -- quoting/parenthesizing made simple
use {'jiangmiao/auto-pairs', opt = true} -- auto pair parentheses
use {'windwp/nvim-autopairs', opt = false, config='require("config.auto-pairs")'}
use {'alvan/vim-closetag'}	-- html auto pairs
use "p00f/nvim-ts-rainbow"	-- rainbow parentheses

-- Indentation tracking
use {'nathanaelkane/vim-indent-guides'}

-- Mutli line
use {'mg979/vim-visual-multi'} -- Multiple cursors

-- Highlight colors
use {'RRethy/vim-hexokinase', run = 'make'}

-- Tags
use {'preservim/tagbar', cmd = "Tagbar"}

-- Commenting
use {'b3nj5m1n/kommentary', opt = true}
use {'tpope/vim-commentary', opt = false}

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
use {'ray-x/lsp_signature.nvim', opt = true, config = 'require("config.lsp_signature")'}
use {'nvim-lua/lsp-status.nvim', config = 'require("config.lsp-status")'}
use {'folke/lsp-trouble.nvim', config = 'require("config.lsp-trouble")'}

-- Runner
use {'michaelb/sniprun', run = 'bash ./install.sh'}

-- Debugging
use {'mfussenegger/nvim-dap', config='require("config.dap")'}
use {'nvim-telescope/telescope-dap.nvim', config='require("config.telescope-dap")'}

-- Git
use {'tpope/vim-fugitive'} -- A plugin for git
use {'lewis6991/gitsigns.nvim'} -- git side signs

-- Github
use {'pwntester/octo.nvim'}

-- Database
use {'tpope/vim-dadbod', cmd = {"DB", "DBUI"}}
use {'kristijanhusak/vim-dadbod-ui', cmd = "DBUI"}

-- Preview
use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}

-- Nevim Development
use {'tjdevries/nlua.nvim', opt = true} -- lua
use {'rafcamlet/nvim-luapad' , opt = true, cmd = "Luapad"} -- lua
use {'rktjmp/lush.nvim'} -- theme

-- Utils
use {"dstein64/vim-startuptime"}	-- Profile startup time

-- Tabnine
-- use {"codota/tabnine-vim"}
