-- Packer configurations
local packer = require("packer")

local u = require("core.util")
local cfg = u.cfg

local plugins = {
	{ "wbthomason/packer.nvim" },
	{ "lewis6991/impatient.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-lua/popup.nvim" },

	{
		"kyazdani42/nvim-tree.lua",
		config = cfg("tree"),
		cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeRefresh" },
	},

	{ "kyazdani42/nvim-web-devicons" },

	{ "hoob3rt/lualine.nvim", config = cfg("lualine") },
	{ "akinsho/bufferline.nvim", config = cfg("bufferline") },
	{ "lukas-reineke/indent-blankline.nvim", config = cfg("indent-blankline") },
	{ "norcalli/nvim-colorizer.lua", config = cfg("colorizer") },
	{
		"windwp/nvim-autopairs",
		config = cfg("autopairs"),
		event = "InsertEnter",
	},

	-- git
	{ "lewis6991/gitsigns.nvim", config = cfg("gitsigns") },
	{
		"sindrets/diffview.nvim",
		config = function()
			require("diffview").setup()
		end,
		cmd = { "DiffviewOpen", "DiffviewFileHistory" },
	},
	{
		"TimUntersberger/neogit",
		config = cfg("neogit"),
		cmd = "Neogit",
	},
	{
		"f-person/git-blame.nvim",
		config = "vim.cmd [[let g:gitblame_enabled = 0]]",
		cmd = "GitBlameToggle",
	},
	{
		"pwntester/octo.nvim",
		config = function()
			require("octo").setup()
		end,
	},

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		config = cfg("treesitter"),
		run = ":TSUpdate",
		requires = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			{ "nvim-treesitter/playground", cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" } },
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
			{
				"windwp/nvim-ts-autotag",
				config = function()
					require("nvim-ts-autotag").setup({})
				end,
				event = "InsertEnter",
			},
			{ "p00f/nvim-ts-rainbow" },
			{
				"abecodes/tabout.nvim",
				config = function()
					require("tabout").setup()
				end,
				event = "InsertEnter",
			},
		},
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("lsp").setup()
		end,
		requires = {
			"jose-elias-alvarez/null-ls.nvim",
			"folke/lua-dev.nvim",
			{
				"rmagatti/goto-preview",
				config = function()
					require("goto-preview").setup({})
				end,
			},
			{
				"folke/trouble.nvim",
				config = function()
					require("trouble").setup()
				end,
			},
			{
				"ray-x/lsp_signature.nvim",
				config = cfg("lsp_signature"),
				event = "InsertEnter",
			},
			{
				"simrat39/symbols-outline.nvim",
				config = cfg("symbols-outline"),
				cmd = "SymbolsOutline",
			},
			{ "j-hui/fidget.nvim", config = cfg("fidget") },
		},
	},
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
			"L3MON4D3/LuaSnip",
		},
	},
	-- DAP
	{
		"mfussenegger/nvim-dap",
		requires = {
			"leoluz/nvim-dap-go",
			"mfussenegger/nvim-dap-python",
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
			"jbyuki/one-small-step-for-vimkind",
		},
		config = function()
			require("dbg").setup()
		end,
	},
	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		config = cfg("telescope"),
		cmd = "Telescope",
		requires = {
			{ "nvim-telescope/telescope-packer.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		},
	},
	-- comment
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
	-- motion
	{
		"phaazon/hop.nvim",
		config = function()
			require("hop").setup()
		end,
	},
	-- ui
	{ "stevearc/dressing.nvim", config = cfg("dressing") },
	{
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
		end,
	},
	{
		"sindrets/winshift.nvim",
		cmd = "WinShift",
	},
	-- buffer
	{ "famiu/bufdelete.nvim" },
	-- keymapping
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end,
	},
	{ "tpope/vim-surround" },
	-- multi line
	{ "mg979/vim-visual-multi" }, -- Multiple cursors
	-- undo
	{
		"mbbill/undotree",
		config = "vim.g.undotree_SetFocusWhenToggle = 1",
		cmd = "UndotreeToggle",
	},
	-- Runner
	{
		"michaelb/sniprun",
		run = "bash ./install.sh",
		cmd = "SnipRun",
	},
	-- preview
	{
		"iamcco/markdown-preview.nvim",
		config = function()
			vim.g.mkdp_auto_close = 0
		end,
		run = "cd app && yarn install",
		cmd = "MarkdownPreview",
		ft = "markdown",
	},
	-- nevim development
	{
		"rafcamlet/nvim-luapad",
		opt = true,
		cmd = "Luapad",
	},
	-- terminal
	{
		"akinsho/toggleterm.nvim",
		config = cfg("toggleterm"),
		cmd = "ToggleTerm",
	},
	-- util
	{ "sudormrfbin/cheatsheet.nvim", cmd = "Cheatsheet" },
	{ "dstein64/vim-startuptime", cmd = "StartupTime" },
}

local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"vimball",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

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
