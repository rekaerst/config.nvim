-- Packer configurations
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print(packer_bootstrap)
end

local packer = require("packer")

local u = require("core.util")
local cfg = u.cfg

local plugins = {
	{ "wbthomason/packer.nvim" },
	{ "lewis6991/impatient.nvim" },
	-- Libraries
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-lua/popup.nvim" },
	-- Icons
	{ "kyazdani42/nvim-web-devicons" },
	-- Terminal
	{
		"akinsho/toggleterm.nvim",
		config = cfg("toggleterm"),
		cmd = "ToggleTerm",
	},
	-- LSP
	{ "neovim/nvim-lspconfig" },
	{ "jose-elias-alvarez/null-ls.nvim" },
	{
		"tami5/lspsaga.nvim",
		config = cfg("lspsaga"),
	},
	{
		"folke/trouble.nvim",
		config = cfg("trouble"),
	},
	{
		"ray-x/lsp_signature.nvim",
		config = cfg("lsp_signature"),
	},
	{
		"simrat39/symbols-outline.nvim",
		config = cfg("symbols-outline"),
	},
	{ -- Standalone UI for nvim-lsp progress
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({
				sources = {
					["null-ls"] = {
						ignore = true,
					},
				},
			})
		end,
	},
	{ "folke/lua-dev.nvim" },
	-- Completion
	{
		"hrsh7th/nvim-cmp",
		config = cfg("cmp"),
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-emoji",
			"saadparwaiz1/cmp_luasnip",
		},
	},
	-- DAP
	{
		"mfussenegger/nvim-dap",
		requires = {
			"leoluz/nvim-dap-go",
			"mfussenegger/nvim-dap-python",
			"jbyuki/one-small-step-for-vimkind",
			"nvim-telescope/telescope-dap.nvim",
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		config = function()
			require("dapui").setup()
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	},
	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		config = cfg("treesitter"),
		run = ":TSUpdate",
	}, -- Semantic highlighting
	{
		"nvim-treesitter/playground",
		cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
	},
	{
		"lewis6991/spellsitter.nvim",
		config = function()
			require("spellsitter").setup()
		end,
	},
	-- Snips
	{ "L3MON4D3/LuaSnip" },
	-- Commenting
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	-- Motion
	{
		"phaazon/hop.nvim",
		config = function()
			require("hop").setup()
		end,
	},
	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		config = cfg("telescope"),
	}, -- Fizzy
	{ "nvim-telescope/telescope-packer.nvim" },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	},
	-- Powerline
	{
		"hoob3rt/lualine.nvim",
		config = cfg("lualine"),
	},
	-- -- Tab bar
	{
		"akinsho/bufferline.nvim",
		config = cfg("bufferline"),
	},
	-- File explorer
	{
		"kyazdani42/nvim-tree.lua",
		config = cfg("tree"),
	},
	-- Window manager
	{
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
		end,
	},
	{ "sindrets/winshift.nvim" },
	-- Keymapping
	{
		"folke/which-key.nvim",
		config = cfg("whichkey"),
	},
	-- Parentheses
	{
		"windwp/nvim-autopairs",
		config = cfg("autopairs"),
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({})
		end,
	},
	{ "p00f/nvim-ts-rainbow" },
	{
		"abecodes/tabout.nvim",
		config = cfg("tabout"),
	},
	{ "tpope/vim-surround" },
	-- Indentation tracking
	{
		"lukas-reineke/indent-blankline.nvim",
		config = cfg("indent-blankline"),
	},
	-- Multi line
	{ "mg979/vim-visual-multi" }, -- Multiple cursors
	-- Highlight colors
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	-- Undo
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		config = "vim.g.undotree_SetFocusWhenToggle = 1",
	},
	-- Runner
	{
		"michaelb/sniprun",
		run = "bash ./install.sh",
		cmd = "SnipRun",
	},
	-- Git
	{
		"TimUntersberger/neogit",
		config = function()
			require("neogit").setup({})
		end,
	},
	{
		"f-person/git-blame.nvim",
		config = "vim.cmd [[let g:gitblame_enabled = 0]]",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = cfg("gitsigns"),
	},
	-- Github
	{
		"pwntester/octo.nvim",
		config = cfg("octo"),
	},
	-- Preview
	{
		"iamcco/markdown-preview.nvim",
		config = function()
			vim.g.mkdp_auto_close = 0
		end,
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	-- Nevim Development
	{
		"rafcamlet/nvim-luapad",
		opt = true,
		cmd = "Luapad",
	},
	-- util
	{ "dstein64/vim-startuptime" }, -- Profile startup time
	{
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	},
}

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
		prompt_border = "single",
	},
	git = {
		clone_timeout = 6000,
	},
	auto_clean = true,
	compile_on_sync = true,
})

return packer.startup(function(use)
	for _, v in pairs(plugins) do
		use(v)
	end
end)
