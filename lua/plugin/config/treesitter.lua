local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

-- These two are optional and provide syntax highlighting
-- for Neorg tables and the @document.meta tag
parser_configs.norg_meta = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
        files = { "src/parser.c" },
        branch = "main"
    },
}

parser_configs.norg_table = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
        files = { "src/parser.c" },
        branch = "main"
    },
}
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
		"norg",
		"norg_meta",
		"norg_table",
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
})

local ft_to_lang = require("nvim-treesitter.parsers").ft_to_lang
require("nvim-treesitter.parsers").ft_to_lang = function(ft)
	if ft == "zsh" then
		return "bash"
	end
	return ft_to_lang(ft)
end

vim.opt.foldlevelstart = 99
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
