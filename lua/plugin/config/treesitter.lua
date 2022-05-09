-- treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"clojure",
		"cmake",
		"c",
		"c_sharp",
		"commonlisp",
		"cpp",
		"css",
		"cuda",
		"dot",
		"gdscript",
		"glsl",
		"go",
		"godot_resource",
		"gomod",
		"haskell",
		"html",
		"http",
		"java",
		"javascript",
		"jsdoc",
		"json",
		"json5",
		"jsonc",
		"julia",
		"kotlin",
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
		"rst",
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
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	textobjects = {
		lsp_interop = {
			enable = true,
			border = "single",
			peek_definition_code = {
				["gpf"] = "@function.outer",
				["gpF"] = "@class.outer",
			},
		},
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
				["aC"] = "@conditional.outer",
				["iC"] = "@conditional.inner",
				["ae"] = "@block.outer",
				["ie"] = "@block.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
				["is"] = "@statement.inner",
				["as"] = "@statement.outer",
				["ad"] = "@comment.outer",
				["am"] = "@call.outer",
				["im"] = "@call.inner",
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
			select = {
				enable = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
					["iF"] = {
						python = "(function_definition) @function",
						cpp = "(function_definition) @function",
						c = "(function_definition) @function",
						java = "(method_declaration) @function",
						go = "(method_declaration) @function",
					},
				},
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
