local M = {}

function M.reg_main()
	local u = require("core.util")
	local dap = require("dap")
	local dapui = require("dapui")
	local telescope = require("telescope.builtin")

	local wk = require("which-key")
	wk.register({
		["<leader>"] = {
			f = {
				name = "File",
				w = { ":w<cr>", "Save Current File" },
				a = { ":wa<cr>", "Save All Files" },
				x = { ":wq<cr>", "Save and Close" },
				r = { telescope.oldfiles, "Open Recent" },
				f = { telescope.find_files, "Find File" },
				g = { telescope.gitfiles, "Git Files" },
			},
			e = {
				name = "Edit",
				f = { telescope.live_grep, "Find" },
				t = { telescope.treesitter, "Treesitter" },
				s = { telescope.grep_string, "Find String" },
				h = { "<cmd>noh<cr>", "Clear Highlight" },
				e = { "<cmd>set foldmethod=expr<cr>", "Enable folding" },
			},
			b = {
				name = "Buffer",
				f = { telescope.buffers, "Find Buffer" },
				d = { "<cmd>bd<cr>", "Delete Buffer" },
				D = { "<cmd>bd!<cr>", "Force Delete Buffer" },
				p = { "<cmd>BufferLinePick<cr>", "Pick Buffer" },
				s = { "<cmd>BufferLineSortByDirectory<cr>", "Sort Buffer by Directory" },
				["]"] = { "<cmd>BufferLineCycleNext<cr>", "Next Buffer" },
				["["] = { "<cmd>BufferLineCyclePrev<cr>", "Previous Buffer" },
				[">"] = { "<cmd>BufferLineMoveNext<cr>", "Move Buffer to Next" },
				["<"] = { "<cmd>BufferLineMovePrev<cr>", "Move Buffer to Previous" },
			},
			r = {
				name = "Run",
				s = { "<cmd>SnipRun<cr>", "SnipRun" },
				t = { "<cmd>ToggleTerm<cr>", "Terminal" },
			},
			d = {
				name = "Debug",
				b = { dap.toggle_breakpoint, "Toggle Breakpoint" },
				B = {
					function()
						dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
					end,
					"Conditional BreakPoint",
				},
				C = { dap.clear_breakpoints, "Clear Breakpoints" },
				c = { dap.continue, "Continue" },
				e = { dapui.eval, "Evaluate Expression" },
				k = { dap.step_over, "Step Over" },
				j = { dap.step_back, "Step Back" },
				o = { dap.step_out, "Step Out" },
				i = { dap.step_into, "Step Into" },
				r = { dap.repl.open, "Open Debug REPL" },
				t = { dap.terminate, "Stop Debugging" },
				g = { dap.run_to_cursor, "Run to Cursor" },
				G = { dap.goto_, "Goto Cursor" },
				u = { dapui.toggle, "Toggle Debug UI" },
			},
			t = { ":Telescope builtin<cr>", "Telescope" },
			v = {
				name = "View",
				t = { "<cmd>NvimTreeToggle<cr>", "File Browser" },
				c = { "<cmd>ColorizerToggle<cr>", "Colorizer" },
				T = { "<cmd>NvimTreeRefresh<cr>", "Refresh File Browser" },
				f = { "<cmd>NvimTreeFindFile<cr>", "Find File in Tree" },
				e = {
					':if &ve == "all" | echo "disable venn " | set ve= | else | set ve=all | echo "enable venn" | endif | :IndentGuidesToggle | :lua Toggle_venn() <cr>',
					"Venn",
				},
				s = { "<cmd>SymbolsOutline<cr>", "Outline" },
				k = { telescope.keymaps, "Keymaps" },
				r = { "<cmd>set relativenumber!<cr>", "Relative Number" },
				m = { "<cmd>MarkdownPreview<cr>", "Preview Markdown" },
				g = { "<cmd>Neogit<cr>", "Open Neogit" },
				p = { "<cmd>:set spell!<cr>", "Spell Check" },
			},
			h = {
				name = "Misc",
				h = { "<cmd>help<cr>", "Open Help" },
				f = { "<cmd>Telescope help_tags<cr>", "Find Help" },
				d = { require("osv").launch, "Debug Neovim" },
				c = { "<cmd>LuaCacheClear<cr>", "Clean Cache" },
			},
			w = {
				name = "Window",
				h = { "<cmd>WinShift left<cr>", "Move Left" },
				j = { "<cmd>WinShift down<cr>", "Move Down" },
				k = { "<cmd>WinShift up<cr>", "Move Up" },
				l = { "<cmd>WinShift right<cr>", "Move Right" },
				s = { "<cmd>WinShift swap<cr>", "Swap" },
			},
			["<C-q>"] = { ":qa!<cr>", "Quit" },
		},
		g = {
			b = "Block Comment",
			c = "Line Comment",
		},
		["<F6>"] = { ":up | :make<cr>", "Make" },
		["<F9>"] = { dap.toggle_breakpoint, "Toggle Breakpoint" },
		["<F5>"] = { dap.continue, "Continue" },
		["<F10>"] = { dap.step_over, "Step Over" },
		["<F11>"] = { dap.step_into, "Step Into" },
		["<F8>"] = { dap.step_back, "Step Back" },
		["<F23>"] = { dap.setp_out, "Step Out" },
		["<F29>"] = { dap.terminate, "Stop Debugging" },
	}, { silent = true })

	-- Visual mode
	wk.register({
		["<leader>"] = {
			r = {
				name = "Run",
				s = { ":SnipRun <cr>", "SnipRun" },
			},
		},
	}, {
		mode = "v",
	})

	-- Emacs keys
	vim.cmd([[
 	imap <C-a> <C-o>I
 	imap <C-e> <C-o>$
	]])
end

-- invoked when a language server was attached
function M.reg_lsp(bufnr)
	local provider = require("lspsaga.provider")
	local actoin = require("lspsaga.action")
	local telescope = require("telescope.builtin")
	local lspformat = require("lsp-format")

	require("which-key").register({
		["<leader>"] = {
			c = {
				name = "Code",
				d = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Show Diagnostics" },
				a = { "<cmd>Lspsaga code_action<CR>", "Code Action" },
				n = { "<cmd>Lspsaga rename<cr>", "Rename" },
				f = { lspformat.format, "Format Documents" },
				F = { "<cmd>FormatToggle<cr>", "Toggle Auto Formatting" },
				t = { "<cmd>Trouble<cr>", "Trouble" },
				w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
				r = { "<cmd>Trouble lsp_references<cr>", "References" },
				q = { "<cmd>Trouble quickfix<cr>", "Quick Fix" },
				s = { telescope.lsp_document_symbols, "Find Symbols" },
				S = { telescope.lsp_workspace_symbols, "Find Symbols (workspace)" },
				["["] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Previous Diagnostic" },
				["]"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic" },
			},
		},
		["g"] = {
			name = "Go",
			D = { vim.lsp.buf.declaration, "Go to Declaration" },
			d = { "<cmd>Trouble lsp_definitions<cr>", "Go to Definition" },
			i = { "<cmd>Trouble lsp_implementations<cr>", "Go to Implementation" },
			r = { "<cmd>Trouble lsp_references<cr>", "References" },
			s = { telescope.lsp_document_symbols, "Document Symbols" },
			S = { telescope.lsp_workspace_symbols, "Workspace Symbols" },
			p = { provider.preview_definition, "Preview Definition" },
			P = { provider.lsp_finder, "Providers" },
		},
		["K"] = { "<cmd>Lspsaga hover_doc<CR>", "Hover" },
		["<C-d>"] = {
			function()
				actoin.smart_scroll_with_saga(1, "<c-d>")
			end,
			"Scroll Down",
		},
		["<C-u>"] = {
			function()
				actoin.smart_scroll_with_saga(-1, "<c-u>")
			end,
			"Scroll Up",
		},
	}, { buffer = bufnr })
end

-- invoked only when cwd is a git repo
function M.reg_git(bufnr)
	local gitsigns = package.loaded.gitsigns
	local wk = require("which-key")

	wk.register({
		["<leader>"] = {
			g = {
				name = "Git",
				s = { ":Gitsigns stage_hunk<CR>", "Stage Hunk" },
				r = { ":Gitsigns reset_hunk<CR>", "Reset Hunk" },
				S = { gitsigns.stage_buffer, "Stage All Hunk" },
				u = { gitsigns.undo_stage_hunk, "Reset All Hunk" },
				R = { gitsigns.reset_buffer, "Unstage All Huck for Buffer" },
				p = { gitsigns.preview_hunk, "Preview Hunk" },
				b = { ":GitBlameToggle<cr>", "Git Blame Line" },
				B = {
					function()
						gitsigns.blame_line({ full = true })
					end,
					"Full Blame",
				},
				d = { gitsigns.diffthis, "Show diff" },
				x = { gitsigns.toggle_deleted, "Show Deleted" },
			},
		},
	}, {
		buffer = bufnr,
	})
	-- For visual mode
	wk.register({
		["<leader>"] = {
			g = {
				name = "Git",
				s = { ":Gitsigns stage_hunk<CR>", "Stage Hunk" },
				r = { ":Gitsigns reset_hunk<CR>", "Reset Hunk" },
			},
		},
	}, {
		mode = "v",
		buffer = bufnr,
	})
end

return M
