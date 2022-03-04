local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local trouble = require("trouble.providers.telescope")
local u = require('utils')
local t = require("telescope")
local le = t.load_extension
t.setup {
	defaults = {
		mappings = {
			i = {
				["<c-t>"] = trouble.open_with_trouble,
				["<esc"] = actions.close,
				["<M-p>"] = action_layout.toggle_preview
			},
			n = {
				["<c-t>"] = trouble.open_with_trouble,
				["<M-p>"] = action_layout.toggle_preview,
				["cd"] = function(prompt_bufnr)
					local selection = require("telescope.actions.state").get_selected_entry()
					local dir = vim.fn.fnamemodify(selection.path, ":p:h")
					require("telescope.actions").close(prompt_bufnr)
					-- Depending on what you want put `cd`, `lcd`, `tcd`
					vim.cmd(string.format("silent lcd %s", dir))
				end
			}
		}
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case" -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		}
	}
}
le('fzf')
le('octo')
le('emoji')
le('dap')

u.lmap('ff', '<cmd>Telescope find_files<cr>')
u.lmap('fg', '<cmd>Telescope live_grep<cr>')
u.lmap('fG', '<cmd>Telescope gitfiles<cr>')
u.lmap('fs', '<cmd>grep_string<cr>')
u.lmap('fb', '<cmd>Telescope buffers<cr>')
u.lmap('fh', '<cmd>Telescope help_tags<cr>')
u.lmap('ft', '<cmd>Telescope treesitter<cr>')
u.lmap('fm', '<cmd>Telescope keymaps<cr>')
u.lmap('fB', '<cmd>Telescope builtin<cr>')
u.lmap('ps', '<cmd>Telescope lsp_document_symbols')
u.lmap('pw', '<cmd>Telescope lsp_workspace_symbols')
