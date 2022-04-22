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
	{ "akinsho/toggleterm.nvim", config = cfg("toggleterm"), cmd = "ToggleTerm" },
	-- LSP
	{ "neovim/nvim-lspconfig" },
	{ "jose-elias-alvarez/null-ls.nvim" },
	{
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({})
		end,
	},
	{ "folke/trouble.nvim", config = cfg("trouble") },
	{ "ray-x/lsp_signature.nvim", config = cfg("lsp_signature") },
	{ "simrat39/symbols-outline.nvim", config = cfg("symbols-outline") },
	{ "j-hui/fidget.nvim", config = cfg("fidget") },
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
	{ "nvim-treesitter/nvim-treesitter", config = cfg("treesitter"), run = ":TSUpdate" }, -- Semantic highlighting
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
	{
		"lewis6991/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup()
		end,
	},
	{ "L3MON4D3/LuaSnip" },
	-- Commenting
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup()
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
	{ "nvim-telescope/telescope.nvim", config = cfg("telescope") }, -- Fizzy
	{ "nvim-telescope/telescope-packer.nvim" },
	{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
	-- UI
	{ "stevearc/dressing.nvim", config = cfg("dressing") },
	-- Powerline
	{ "hoob3rt/lualine.nvim", config = cfg("lualine") },
	-- File explorer
	{ "kyazdani42/nvim-tree.lua", config = cfg("tree") },
	-- Window Management
	{
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
		end,
	},
	{ "sindrets/winshift.nvim" },
	-- Buffer Management
	{ "akinsho/bufferline.nvim", config = cfg("bufferline") },
	{ "famiu/bufdelete.nvim" },
	-- Keymapping
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end,
	},
	-- Parentheses
	{ "windwp/nvim-autopairs", config = cfg("autopairs") },
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({})
		end,
	},
	{ "p00f/nvim-ts-rainbow" },
	{
		"abecodes/tabout.nvim",
		config = function()
			require("tabout").setup()
		end,
	},
	{ "tpope/vim-surround" },
	-- Indentation tracking
	{ "lukas-reineke/indent-blankline.nvim", config = cfg("indent-blankline") },
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
	{ "mbbill/undotree", cmd = "UndotreeToggle", config = "vim.g.undotree_SetFocusWhenToggle = 1" },
	-- Runner
	{ "michaelb/sniprun", run = "bash ./install.sh", cmd = "SnipRun" },
	-- Git
	{ "f-person/git-blame.nvim", config = "vim.cmd [[let g:gitblame_enabled = 0]]" },
	{ "lewis6991/gitsigns.nvim", config = cfg("gitsigns") },
	{
		"sindrets/diffview.nvim",
		config = function()
			require("diffview").setup()
		end,
	},
	{ "TimUntersberger/neogit", config = cfg("neogit") },
	-- Github
	{
		"pwntester/octo.nvim",
		config = function()
			require("octo").setup()
		end,
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
	{ "rafcamlet/nvim-luapad", opt = true, cmd = "Luapad" },
	-- util
	{ "sudormrfbin/cheatsheet.nvim" },
	{ "dstein64/vim-startuptime" }, -- Profile startup time
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
