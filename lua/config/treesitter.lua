-- treesitter
require('nvim-treesitter.configs').setup ({
	ensure_installed = {"bash","c", "clojure", "cpp", "css", "go", "gdscript", "haskell", "html",
	"javascript", "java", "json", "jsonc","latex", "lua", "python", "query","r", "regex", "rust",
	"scss","typescript", "vue", "yaml"},
	highlight = {
		enable = true,              -- false will disable the whole extension
	},
	incremental_selection = {
		enable = true,
	},
	playground = {
		enable = true,
	},
	indent = {
		disable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = 1000,
	}
})


