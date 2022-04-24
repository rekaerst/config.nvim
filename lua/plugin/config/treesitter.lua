-- treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"c",
		"cmake",
		"clojure",
		"commonlisp",
		"cpp",
		"css",
		"cuda",
		"dot",
		"gdscript",
		"glsl",
		"godot_resource",
		"go",
		"gomod",
		"haskell",
		"html",
		"http",
		"jsdoc",
		"json5",
		"julia",
		"latex",
		"llvm",
		"lua",
		"make",
		"markdown",
		"ninja",
		"python",
		"query",
		"r",
		"regex",
		"rust",
		"scss",
		"supercollider",
		"todotxt",
		"toml",
		"typescript",
		"vala",
		"vim",
		"vue",
		"yaml",
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	playground = {
		enable = true,
	},
	indent = {
		enable = true,
		disable = { "python" },
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	textobjects = {
		select = {
			enable = true,

			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,

			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
	},
})

-- use bash parser for zsh
local ft_to_lang = require("nvim-treesitter.parsers").ft_to_lang
require("nvim-treesitter.parsers").ft_to_lang = function(ft)
	if ft == "zsh" then
		return "bash"
	end
	return ft_to_lang(ft)
end

vim.opt.foldlevelstart = 99
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
