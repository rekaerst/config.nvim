-- Packer configurations
local packer = require("packer")
local present, packer = pcall(require, "packer")

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
	},
	-- LSP
	{ "neovim/nvim-lspconfig" },
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
		config = cfg("symbols-outline")
	},
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
	},
	{
		"mfussenegger/nvim-lint",
		config = cfg("lint"),
	},
	{ "lukas-reineke/lsp-format.nvim" },
	{ "folke/lua-dev.nvim" },
	-- Completion
	{
		"hrsh7th/nvim-cmp",
		config = cfg("cmp"),
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"saadparwaiz1/cmp_luasnip",
		},
	},
	-- DAP
	{ "mfussenegger/nvim-dap" },
	{ "nvim-telescope/telescope-dap.nvim" },
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
	{ "leoluz/nvim-dap-go" },
	{ "mfussenegger/nvim-dap-python" },
	{ "jbyuki/one-small-step-for-vimkind" },
	{ "mfussenegger/nvim-jdtls" },
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
	{ "xiyaowong/telescope-emoji.nvim" },

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
	-- -- Multi line
	{ "mg979/vim-visual-multi" }, -- Multiple cursors
	-- Highlight colors
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	-- -- Undo
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		config = "vim.g.undotree_SetFocusWhenToggle = 1",
	},
	-- -- Runner
	{
		"michaelb/sniprun",
		run = "bash ./install.sh",
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

	-- -- Database
	{
		"tpope/vim-dadbod",
		cmd = { "DB", "DBUI" },
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		cmd = "DBUI",
	},

	-- Preview
	{
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn['mkdp#util#install']() end
	},

	-- -- Nevim Development
	{
		"rafcamlet/nvim-luapad",
		opt = true,
		cmd = "Luapad",
	},

	-- Note
	{
		"jbyuki/venn.nvim",
		config = cfg("venn"),
	},

	-- util
	{ "dstein64/vim-startuptime" }, -- Profile startup time
}

if not present then
	local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	print("Installing packer...")
	vim.fn.delete(packer_path, "rf")
	vim.fn.system("git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", packer_path)

	vim.cmd("packadd packer.nvim")
	local present, packer = pcall(require, "packer")

	if present then
		print("Packer installation succeed")
	else
		error("Packer installation failed")
	end
else
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
end
