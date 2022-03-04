-- Packer configurations
local packer = require('packer')
packer.init()
local use = packer.use
packer.reset()
use 'wbthomason/packer.nvim'

-- Libraries
use {'nvim-lua/plenary.nvim'}
use {'nvim-lua/popup.nvim'}

-- Colorscheme
use {'joshdick/onedark.vim'}
use {'EdenEast/nightfox.nvim'}
use {'folke/tokyonight.nvim'}

-- Icons
use {'kyazdani42/nvim-web-devicons'}

-- LSP
use {'neovim/nvim-lspconfig'}
use {'tami5/lspsaga.nvim'}
use {'folke/trouble.nvim'}
use {'ray-x/lsp_signature.nvim'}
use {'rmagatti/goto-preview'}
use {'simrat39/symbols-outline.nvim'}
use {'j-hui/fidget.nvim'}

-- Completion
use {'hrsh7th/nvim-cmp'}
use {'hrsh7th/cmp-nvim-lsp'}
use {'hrsh7th/cmp-path'}
use {'hrsh7th/cmp-buffer'}
use {'saadparwaiz1/cmp_luasnip'}

-- Treesitter
use {
	'nvim-treesitter/nvim-treesitter',
	run = ':TSUpdate'
} -- Semantic highlighting
use {
	'nvim-treesitter/playground',
	cmd = {'TSPlaygroundToggle', 'TSHighlightCapturesUnderCursor'}
}
-- Snips
use {'L3MON4D3/LuaSnip'}

-- Commenting
use {'numToStr/Comment.nvim'}

-- Telescope
use {'nvim-telescope/telescope.nvim'} -- Fizzy
use {'nvim-telescope/telescope-packer.nvim'}
use {
	'nvim-telescope/telescope-fzf-native.nvim',
	run = 'make'
}
use {'xiyaowong/telescope-emoji.nvim'}

-- Powerline
use {'hoob3rt/lualine.nvim'}

-- -- Tab bar
use {'akinsho/bufferline.nvim'}

-- File explorer
use {'kyazdani42/nvim-tree.lua'}

-- Keymapping
use {'folke/which-key.nvim'} -- displays keybindings when typing

-- Parentheses
use {'windwp/nvim-autopairs'}
use {'windwp/nvim-ts-autotag'}
use {'p00f/nvim-ts-rainbow'}
use {'abecodes/tabout.nvim'}

-- Indentation tracking
use {'nathanaelkane/vim-indent-guides'}

-- -- Mutli line
-- use {'mg979/vim-visual-multi'} -- Multiple cursors

-- Highlight colors
use {
	'RRethy/vim-hexokinase',
	run = 'make'
}

-- -- Undo
-- use {
-- 	'mbbill/undotree',
-- 	cmd = 'UndotreeToggle',
-- 	config='vim.g.undotree_SetFocusWhenToggle = 1'
-- }

-- -- Runner
-- use {'michaelb/sniprun', run = 'bash ./install.sh'}

-- -- Debugging
-- use {'mfussenegger/nvim-dap', config='require("config.dap")'}
-- use {'nvim-telescope/telescope-dap.nvim', config='require("config.telescope-dap")'}

-- -- Git
-- use {'tpope/vim-fugitive'} -- A plugin for git
-- use {'lewis6991/gitsigns.nvim'} -- git side signs

-- Github
use {'pwntester/octo.nvim'}

-- -- Database
-- use {'tpope/vim-dadbod', cmd = {"DB", "DBUI"}}
-- use {'kristijanhusak/vim-dadbod-ui', cmd = "DBUI"}

-- Preview
use {'davidgranstrom/nvim-markdown-preview'}

-- -- Nevim Development
-- use {'tjdevries/nlua.nvim', opt = true} -- lua
-- use {'rafcamlet/nvim-luapad' , opt = true, cmd = "Luapad"} -- lua
-- use {'rktjmp/lush.nvim'} -- theme

-- Note
use {"jbyuki/venn.nvim"}

-- Utils
use {"dstein64/vim-startuptime"} -- Profile startup time

-- -- Tabnine
