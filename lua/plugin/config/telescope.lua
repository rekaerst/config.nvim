local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
local trouble = require("trouble.providers.telescope")
local u = require("core.util")
local t = require("telescope")
local le = t.load_extension
t.setup({
	defaults = {
		mappings = {
			i = {
				["<c-b>"] = trouble.open_with_trouble,
				["<esc"] = actions.close,
				["<M-p>"] = action_layout.toggle_preview,
			},
			n = {
				["<c-b>"] = trouble.open_with_trouble,
				["<M-p>"] = action_layout.toggle_preview,
				["cd"] = function(prompt_bufnr)
					local selection = require("telescope.actions.state").get_selected_entry()
					local dir = vim.fn.fnamemodify(selection.path, ":p:h")
					require("telescope.actions").close(prompt_bufnr)
					-- Depending on what you want put `cd`, `lcd`, `tcd`
					vim.cmd(string.format("silent lcd %s", dir))
				end,
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
})
le("fzf")
le("octo")
le("emoji")
le("dap")
