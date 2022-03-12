-- Packer configurations
local packer = require('packer')
packer.init()
local use = packer.use
packer.reset()
use 'wbthomason/packer.nvim'

use {'lewis6991/impatient.nvim'}

-- Libraries
use {'nvim-lua/plenary.nvim'}
use {'nvim-lua/popup.nvim'}

-- Colorscheme
use {'joshdick/onedark.vim'}
use {'EdenEast/nightfox.nvim'}
use {'folke/tokyonight.nvim'}

-- Icons
use {'kyazdani42/nvim-web-devicons'}

-- Terminal
use {"akinsho/toggleterm.nvim"}

-- LSP
use {'neovim/nvim-lspconfig'}
use {'tami5/lspsaga.nvim'}
use {'folke/trouble.nvim'}
use {'ray-x/lsp_signature.nvim'}
use {'simrat39/symbols-outline.nvim'}
use {'j-hui/fidget.nvim'}
use {'mfussenegger/nvim-lint'}
use {'folke/lua-dev.nvim'}

-- Completion
use {'hrsh7th/nvim-cmp', requires = {
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-buffer',
	'saadparwaiz1/cmp_luasnip'
}}

-- DAP
use {'mfussenegger/nvim-dap'}
use {'nvim-telescope/telescope-dap.nvim'}
use {"rcarriga/nvim-dap-ui"}
use {'theHamsta/nvim-dap-virtual-text'}
use {'leoluz/nvim-dap-go'}
use {'mfussenegger/nvim-dap-python'}
use {'jbyuki/one-small-step-for-vimkind'}
use {'mfussenegger/nvim-jdtls'}

-- Treesitter
use {
	'nvim-treesitter/nvim-treesitter',
	run = ':TSUpdate'
} -- Semantic highlighting
use {
	'nvim-treesitter/playground',
	cmd = {'TSPlaygroundToggle', 'TSHighlightCapturesUnderCursor'}
}
use {'lewis6991/spellsitter.nvim'}

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

-- Window manager
use {'luukvbaal/stabilize.nvim'}
use {'sindrets/winshift.nvim'}

-- Keymapping
use {'folke/which-key.nvim'} -- displays keybindings when typing

-- Parentheses
use {'windwp/nvim-autopairs'}
use {'windwp/nvim-ts-autotag'}
use {'p00f/nvim-ts-rainbow'}
use {'abecodes/tabout.nvim'}
use {'tpope/vim-surround'}

-- Indentation tracking
use {'lukas-reineke/indent-blankline.nvim'}

-- -- Mutli line
use {'mg979/vim-visual-multi'} -- Multiple cursors

-- Highlight colors
use {
	'RRethy/vim-hexokinase',
	run = 'make'
}

-- -- Undo
use {
	'mbbill/undotree',
	cmd = 'UndotreeToggle',
	config = 'vim.g.undotree_SetFocusWhenToggle = 1'
}

-- -- Runner
use {
	'michaelb/sniprun',
	run = 'bash ./install.sh'
}

-- Git
use {'TimUntersberger/neogit'}
use {'f-person/git-blame.nvim'}
use {'lewis6991/gitsigns.nvim'}

-- Github
use {'pwntester/octo.nvim'}

-- -- Database
use {'tpope/vim-dadbod', cmd = {"DB", "DBUI"}}
use {'kristijanhusak/vim-dadbod-ui', cmd = "DBUI"}

-- Preview
use {'davidgranstrom/nvim-markdown-preview'}

-- -- Nevim Development
use {'rafcamlet/nvim-luapad', opt = true, cmd = "Luapad"}

-- Note
use {"jbyuki/venn.nvim"}
use {"nvim-neorg/neorg"}

-- Utils
use {"dstein64/vim-startuptime"} -- Profile startup time
