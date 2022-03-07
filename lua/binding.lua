local M = {}

function M.reg_main()
	local u = require 'utils'
	local dap = require 'dap'
	local dapui = require 'dapui'
	local t = require 'telescope.builtin'

	local wk = require'which-key'
	wk.register({
		['<leader>'] = {
			f = {
				name = "File",
				w = {':w<cr>', "Save Current File"},
				a = {':wa<cr>', "Save All Files"},
				x = {':wq<cr>', "Save and Close"},
				r = { t.oldfiles, "Open Recent",},
				f = {t.find_files, "Find File"},
				g = {t.gitfiles, "Git Files"}
			},
			e = {
				name = "Edit",
				f = {t.live_grep, "Find"},
				t = {t.treesitter, "Treesitter"},
				s = {t.grep_string, "Find String"},
				h = {'<cmd>noh<cr>', "Clear Highlight"},
				e = {'<cmd>set foldmethod=expr<cr>', "Enable folding"},
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
				s = {'<cmd>SnipRun<cr>', "SnipRun"},
				t = {'<cmd>ToggleTerm<cr>', "Terminal"},
			},
			d = {
				name = "Debug",
				b = {dap.toggle_breakpoint, "Toggle Breakpoint"},
				B = {function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, "Conditional BreakPoint"},
				C = {dap.clear_breakpoints, "Clear Breakpoints"},
				c = {dap.continue, "Continue"},
				k = {dap.step_over, "Step Over"},
				j = {dap.step_back, "Step Back"},
				o = {dap.step_out, "Step Out"},
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
				r = {'<cmd>set relativenumber!<cr>', "Relative Number"},
				m = {'<cmd>MarkdownPreview<cr>', "Preview Markdown"},
				g = {'<cmd>Neogit<cr>', "Open Neogit"},
			},
			h = {
				name = "Misc",
				h = {'<cmd>help<cr>', "Open Help"},
				f = {'<cmd>Telescope help_tags<cr>', "Find Help"},
				d = {require"osv".launch, "Debug Neovim"},
				c = {'<cmd>LuaCacheClear<cr>', "Clean Cache"},
			},
			w = {
				name = "Window",
				h = {'<cmd>WinShift left<cr>', "Move Left"},
				j = {'<cmd>WinShift down<cr>', "Move Down"},
				k = {'<cmd>WinShift up<cr>', "Move Up"},
				l = {'<cmd>WinShift right<cr>', "Move Right"},
				s = {'<cmd>WinShift swap<cr>', "Swap"},
			},
			['<C-q>'] = {':qa!<cr>', "Quit"}
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
		['<F8>'] = {dap.step_back, "Step Back"},
		['<F23>'] = {dap.setp_out, "Step Out"},
		['<F29>'] = {dap.terminate, "Stop Debugging"},
	}, {silent = true,})

	-- Visual mode
	wk.register({
		['<leader>'] = {
			r = {
				name = "Run",
				s = {':SnipRun <cr>', "SnipRun"}
			},
		}
	}, {
		mode = 'v',
	})

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
				t = {'<cmd>Trouble<cr>', "Trouble"},
				w = {'<cmd>Trouble workspace_diagnostics<cr>', "Workspace Diagnostics"},
				r = {'<cmd>Trouble lsp_references<cr>', "References"},
				q = {'<cmd>Trouble quickfix<cr>', "Quick Fix"},
				s = {t.lsp_document_symbols, "Find Symbols"},
				S = {t.lsp_workspace_symbols, "Find Symbols (workspace)"},
				['['] = {'<cmd>Lspsaga diagnostic_jump_prev<CR>', "Previous Diagnostic"},
				[']'] = {'<cmd>Lspsaga diagnostic_jump_next<CR>', "Next Diagnostic"}

			}
		},
		['g'] = {
			name = "Go",
			D = {vim.lsp.buf.declaration, "Go to Declaratoin"},
			d = {'<cmd>Trouble lsp_definitions<cr>',"Go to Definition"},
			i = {'<cmd>Trouble lsp_implementations<cr>', "Go to Implementation"},
			r = {'<cmd>Trouble lsp_references<cr>', "References"},
			s = {t.lsp_document_symbols, "Document Symbols"},
			S = {t.lsp_workspace_symbols, "Workspace Symbols"},
			p = {p.preview_definition, "Preview Definition"},
			P = {p.lsp_finder, "Providers"}

		},
		['K'] = {'<cmd>Lspsaga hover_doc<CR>', "Hoverdoc"},
		["<C-d>"] = {function() a.smart_scroll_with_saga(1, "<c-d>") end, "Scroll Down"},
		['<C-u>'] = {function() a.smart_scroll_with_saga(-1, "<c-u>") end, "Scroll Up"}
	}, { buffer = bufnr })
end

function M.reg_git(bufnr)
	local gs = package.loaded.gitsigns
	local wk = require'which-key'

	wk.register({
		['<leader>'] = {
			g = {
				name = "Git",
				s = {':Gitsigns stage_hunk<CR>', "Stage Hunk"},
				r = {':Gitsigns reset_hunk<CR>', "Reset Hunk"},
				S = {gs.stage_buffer, "Stage All Hunk"},
				u = {gs.undo_stage_hunk, "Reset All Hunk" },
				R = {gs.reset_buffer, "Unstage All Huck for Buffer"},
				p = {gs.preview_hunk, "Preview Hunk"},
				b = {':GitBlameToggle<cr>', "Git Blame Line"},
				B = {function() gs.blame_line{full=true} end, "Full Blame"},
				d = {gs.diffthis, "Show diff"},
				x = {gs.toggle_deleted, "Show Deleted"},
			}
		}
	}, {
		buffer = bufnr
	})
	-- For visual mode
	wk.register({
		['<leader>'] = {
			g = {
				name = "Git",
				s = {':Gitsigns stage_hunk<CR>', "Stage Hunk"},
				r = {':Gitsigns reset_hunk<CR>', "Reset Hunk"},
			}
		}
	}, {
		mode = 'v',
		buffer = bufnr,
	})
end

return M
