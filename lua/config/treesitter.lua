-- treesitter
require('nvim-treesitter.configs').setup({
	ensure_installed = {
		'bash', 'c', 'cmake', 'clojure', 'commonlisp', 'cpp', 'css', 'cuda',
		'dot', 'gdscript', 'glsl', 'godot_resource', 'go', 'gomod', 'haskell', 'html',
		'http', 'jsdoc', 'json5', 'julia', 'latex', 'llvm', 'lua', 'make', 'markdown',
		'ninja', 'python', 'query', 'r', 'regex', 'rust', 'scss', 'norg', 'supercollider',
		'todotxt', 'toml', 'typescript', 'vala', 'vim', 'vue', 'yaml'
	},
	highlight = {
		enable = true -- false will disable the whole extension
	},
	incremental_selection = {
		enable = true
	},
	playground = {
		enable = true
	},
	indent = {
		disable = true
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil
	}
})

