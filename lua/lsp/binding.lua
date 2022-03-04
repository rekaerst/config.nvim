local M = {}
local wk = require 'which-key'

M.on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	wk.register({
		['<leader>'] = {
			c = {
				name = "Code",
				d = {'<cmd>Lspsaga show_line_diagnostics<CR>', "Show Diagnostics"},
				a = {'<cmd>Lspsaga code_action<CR>', "Code Action"},
				n = {'<cmd>Lspsaga rename<cr>', "Rename"},
				f = {'<cmd>lua vim.lsp.buf.formatting()<CR>', "Format Documents"},
				p = {'<cmd>lua require"lspsaga.provider".lsp_finder()<CR>', "Providers"},
				t = {'<cmd>Trouble<cr>', "Trouble"},
				w = {'<cmd>Trouble workspace_diagnostics<cr>', "Workspace Diagnostics"},
				r = {'<cmd>Trouble lsp_references<cr>', "References"},
				q = {'<cmd>Trouble quickfix<cr>', "Quick Fix"},
				s = {'<cmd>Telescope lsp_document_symbols<cr>', "Document Symbols"},
				S = {'<cmd>Telescope lsp_workspace_symbols<cr>', "Workspace Symbols"},
				['['] = {'<cmd>Lspsaga diagnostic_jump_prev<CR>', "Previous Diagnostic"},
				[']'] = {'<cmd>Lspsaga diagnostic_jump_next<CR>', "Next Diagnostic"}

			}
		},
		['g'] = {
			name = "Preview",
			d = {'<cmd>lua require"lspsaga.provider".preview_definition()<CR>', "Preview Definition"}
		},
		['K'] = {'<cmd>Lspsaga hover_doc<CR>', "Hoverdoc"},
		["<C-d>"] = {'<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1, "<c-d>")<cr>'},
		['<C-u>'] = {'<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1, "<c-u>")<cr>'}
	}, {
		buffer = bufnr
	})
end
return M
