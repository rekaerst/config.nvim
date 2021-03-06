local u = require("core.util")
local cfg = u.cfg

local plugins = {
	{ "wbthomason/packer.nvim" },
	{ "lewis6991/impatient.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-lua/popup.nvim" },
	-- ui
	{ "kyazdani42/nvim-web-devicons" },
	{
		"kyazdani42/nvim-tree.lua",
		config = cfg("tree"),
		cmd = { "NvimTreeOpen", "NvimTreeToggle", "NvimTreeFocus", "NvimTreeRefresh", "NvimTreeFindFile" },
	},
	{ "stevearc/dressing.nvim", config = cfg("dressing") },
	{ "hoob3rt/lualine.nvim", config = cfg("lualine") },
	{ "akinsho/bufferline.nvim", config = cfg("bufferline") },
	{ "lukas-reineke/indent-blankline.nvim", config = cfg("indent-blankline") },
	{ "norcalli/nvim-colorizer.lua", config = cfg("colorizer") },
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
	{ "famiu/bufdelete.nvim" },
	-- git
	{ "lewis6991/gitsigns.nvim", config = cfg("gitsigns") },
	{
		"sindrets/diffview.nvim",
		config = cfg("diffview"),
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
	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		config = cfg("treesitter"),
		run = ":TSUpdate",
		requires = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"p00f/nvim-ts-rainbow",
			{
				"nvim-treesitter/playground",
				cmd = {
					"TSPlaygroundToggle",
					"TSHighlightCapturesUnderCursor",
				},
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
			{
				"windwp/nvim-ts-autotag",
				config = function()
					require("nvim-ts-autotag").setup({})
				end,
				ft = { "html", "xml" },
			},
			{
				"abecodes/tabout.nvim",
				config = function()
					require("tabout").setup({})
				end,
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
			{
				"folke/lua-dev.nvim",
				config = cfg("luadev"),
				ft = "lua",
			},
			{
				"p00f/clangd_extensions.nvim",
				config = cfg("clangd"),
				ft = { "c", "cpp", "cuda" },
			},
			{
				"rmagatti/goto-preview",
				config = function()
					require("goto-preview").setup({})
				end,
			},
			{ "folke/trouble.nvim", config = cfg("trouble") },
			{ "ray-x/lsp_signature.nvim", config = cfg("lsp_signature") },
			{
				"simrat39/symbols-outline.nvim",
				config = cfg("symbols-outline"),
				cmd = "SymbolsOutline",
			},
			{ "j-hui/fidget.nvim", config = cfg("fidget") },
		},
	},
	-- completion
	{
		"hrsh7th/nvim-cmp",
		config = cfg("cmp"),
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-cmdline",
			"kdheepak/cmp-latex-symbols",
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
	-- runner
	{
		"michaelb/sniprun",
		run = "bash ./install.sh",
		cmd = "SnipRun",
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
			require("Comment").setup({})
		end,
	},
	{
		"folke/todo-comments.nvim",
		config = cfg("todo-comments"),
	},
	-- parentheses
	{ "tpope/vim-surround" },
	{
		"windwp/nvim-autopairs",
		config = cfg("autopairs"),
		event = "InsertEnter",
	},
	-- motion
	{
		"phaazon/hop.nvim",
		config = function()
			require("hop").setup()
		end,
	},
	-- keymapping
	{
		"folke/which-key.nvim",
		config = cfg("whichkey"),
	},
	-- multi line
	{ "mg979/vim-visual-multi" },
	-- undo
	{
		"mbbill/undotree",
		config = "vim.g.undotree_SetFocusWhenToggle = 1",
		cmd = "UndotreeToggle",
	},
	-- preview
	{
		"iamcco/markdown-preview.nvim",
		config = function()
			vim.g.mkdp_auto_close = 0
		end,
		run = "cd app && npm install",
		cmd = "MarkdownPreview",
		ft = "markdown",
	},
	-- terminal
	{ "akinsho/toggleterm.nvim", config = cfg("toggleterm") },
	-- rust
	{
		"simrat39/rust-tools.nvim",
		config = cfg("rusttools"),
		ft = "rust",
	},
	-- lua repl
	{
		"rafcamlet/nvim-luapad",
		opt = true,
		cmd = "Luapad",
	},
	-- assembly
	{ "Shirk/vim-gas" },
	-- misc
	{
		"ahmedkhalf/project.nvim",
		config = cfg("project"),
	},
	{ "monaqa/dial.nvim", config = cfg("dial") },
	{ "sudormrfbin/cheatsheet.nvim", cmd = "Cheatsheet" },
	{ "dstein64/vim-startuptime", cmd = "StartupTime" },
	{ "milisims/nvim-luaref" },
	{ "jamessan/vim-gnupg" },
	{ "antoinemadec/FixCursorHold.nvim" },
}

local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"vimball",
}

-- bootstrap
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if not u.path.exists(install_path) then
	_G.packer_bootstrap = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	vim.cmd("packadd packer.nvim")
end

local packer = require("packer")

local M = {}

function M.setup()
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

	packer.startup(function(use)
		for _, v in pairs(plugins) do
			use(v)
		end
	end)

	if packer_bootstrap then
		if packer.config.compile_path then
			os.remove(packer.config.compile_path)
		end
		packer.sync()
	end
end

return M
