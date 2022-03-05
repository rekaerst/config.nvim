local M = {}

function M.reg_main()
	local u = require 'utils'
	local dap = require 'dap'
	local dapui = require 'dapui'
	local t = require 'telescope.builtin'

	require('which-key').register({
		['<leader>'] = {
			f = {
				name = "File",
				w = {':w<cr>', "Save Current File"},
				a = {':wa<cr>', "Save All Files"},
				x = {':wq<cr>', "Save and Close"},
				r = { t.oldfiles, "Open Recent File",},
				f = {t.find_files, "Find File"},
				g = {t.gitfiles, "Git Files"}
			},
			e = {
				name = "Edit",
				f = {t.live_grep, "Find"},
				t = {t.treesitter, "Treesitter"},
				s = {t.grep_string, "Find String"}
			},
			b = {
				name = "Buffer",
				f = {t.buffers, "Find Buffer"},
				d = {'<cmd>bd<cr>', "Delete Buffer"},
				D = {'<cmd>bd!<cr>', "Force Delete Buffer"},
				p = {'<cmd>BufferLinePick<cr>', "Pick Buffer"},
				[']'] = {'<cmd>BufferLineCycleNext<cr>', "Next Buffer"},
				['['] = {'<cmd>BufferLineCyclePrev<cr>', "Previous Buffer"},
				['>'] = {'<cmd>BufferLineMoveNext<cr>', "Move Buffer to Next"},
				['<'] = {'<cmd>BufferLineMovePrev<cr>', "Move Buffer to Previous"}
			},
			r = {
				name = "Run",
				s = {':SnipRun <cr>', "SnipRun"}
			},
			d = {
				name = "Debug",
				b = {dap.toggle_breakpoint, "Toggle Breakpoint"},
				B = {function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, "Conditional BreakPoint"},
				c = {dap.continue, "Continue"},
				o = {dap.step_over, "Step Over"},
				O = {dap.step_out, "Step Out"},
				i = {dap.step_into, "Step Into"},
				r = {dap.repl.open, "Open Debug REPL"},
				t = {dap.terminate, "Stop Debugging"},
				g = {dap.run_to_cursor, "Run to Cursor"},
				G = {dap.goto_, "Goto Cursor"},
				u = {dapui.toggle, "Toggle Debug UI"}
			},
			t = {":Telescope builtin<cr>", "Telescope"},
			v = {
				name = "View",
				t = {'<cmd>NvimTreeToggle<cr>', "File Browser"},
				T = {'<cmd>NvimTreeRefresh<cr>', "Refresh File Browser"},
				f = {'<cmd>NvimTreeFindFile<cr>', "Find File in Tree"},
				e = {':if &ve == "all" | echo "disable venn " | set ve= | else | set ve=all | echo "enable venn" | endif | :IndentGuidesToggle | :lua Toggle_venn() <cr>',
				"Venn"},
				s = {'<cmd>SymbolsOutline<cr>', "Outline"},
				k = {t.keymaps, "Keymaps"},
				n = {'<cmd>set relativenumber!<cr>', "Relative Number"},
				m = {'<cmd>MarkdownPreview<cr>', "Preview Markdown"},
				g = {'<cmd>Neogit<cr>', "Open Neogit"},
				b = {'<cmd>GitBlameToggle', "Show Git Blame"},
			},
			h = {
				name = "Help",
				h = {':help<cr>', "Open Help"},
				f = {'<cmd>Telescope help_tags<cr>', "Find Help"},
				d = {require"osv".launch, "Debug Neovim"}
			},
		},
		g = {
			b = "Block Comment",
			c = "Line Comment",
		},
		['<F6>'] = {':w | :make<cr>', "Make"},
		['<F9>'] = {dap.toggle_breakpoint, "Toggle Breakpoint"},
		['<F5>'] = {dap.continue, "Continue"},
		['<F10>'] = {dap.step_over, "Step Over"},
		['<F11>'] = {dap.step_into, "Step Into"},
		['<F23>'] = {dap.setp_out, "Step Out"},
		['<F29>'] = {dap.terminate, "Stop Debugging"},
	}, {silent = true,})

	u.imap('<C-a>', '<C-o>^')
	u.imap('<C-e>', '<C-o>$')

end

function M.reg_lsp(bufnr)
	local p = require 'lspsaga.provider'
	local a = require 'lspsaga.action'
	local t = require 'telescope.builtin'

	require('which-key').register({
		['<leader>'] = {
			c = {
				name = "Code",
				d = {'<cmd>Lspsaga show_line_diagnostics<CR>', "Show Diagnostics"},
				a = {'<cmd>Lspsaga code_action<CR>', "Code Action"},
				n = {'<cmd>Lspsaga rename<cr>', "Rename"},
				f = {vim.lsp.buf.formatting, "Format Documents"},
				p = {p.lsp_finder, "Providers"},
				t = {'<cmd>Trouble<cr>', "Trouble"},
				w = {'<cmd>Trouble workspace_diagnostics<cr>', "Workspace Diagnostics"},
				r = {'<cmd>Trouble lsp_references<cr>', "References"},
				q = {'<cmd>Trouble quickfix<cr>', "Quick Fix"},
				s = {t.lsp_document_symbols, "Document Symbols"},
				S = {t.lsp_workspace_symbols, "Workspace Symbols"},
				['['] = {'<cmd>Lspsaga diagnostic_jump_prev<CR>', "Previous Diagnostic"},
				[']'] = {'<cmd>Lspsaga diagnostic_jump_next<CR>', "Next Diagnostic"}

			}
		},
		['g'] = {
			name = "Go",
			D = {vim.lsp.buf.declaration, "Goto Declaratoin"},
			d = {'<cmd>Trouble lsp_definitions<cr>',"Goto Definition"},
			i = {'<cmd>Trouble lsp_implementations<cr>', "Goto Implementation"},
			r = {'<cmd>Trouble lsp_references<cr>', "References"},
			s = {t.lsp_document_symbols, "Document Symbols"},
			S = {t.lsp_workspace_symbols, "Workspace Symbols"},
			p = {p.preview_definition, "Preview Definition"}

		},
		['K'] = {'<cmd>Lspsaga hover_doc<CR>', "Hoverdoc"},
		["<C-d>"] = {function() a.smart_scroll_with_saga(1, "<c-d>") end, "Scroll Down"},
		['<C-u>'] = {function() a.smart_scroll_with_saga(-1, "<c-u>") end, "Scroll Up"}
	}, {
		buffer = bufnr
	})
end

function M.reg_git(bufnr)
	require('which-key').register({
		['<leader>'] = {
			g = {
				name = "Git",
				s = {':Gitsigns stage_hunk<CR>', "Stage Hunk"},
				r = {':Gitsigns reset_hunk<CR>', "Reset Hunk"},
			}
		}
	}, {
		buffer = bufnr
	})
end

return M
