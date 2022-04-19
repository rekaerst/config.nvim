local M = {}
local telescope = require("telescope.builtin")
local autocmd = vim.api.nvim_create_autocmd

function M.reg_main()
	local diffview = require("diffview")
	local dap = require("dap")
	local dapui = require("dapui")

	local wk = require("which-key")
	wk.register({
		["<leader>"] = {
			f = {
				name = "File",
				r = { telescope.oldfiles, "Open Recent" },
				f = { telescope.find_files, "Find File" },
				w = { ":w<cr>", "Save Current File" },
				a = { ":wa<cr>", "Save All Files" },
				x = { ":wq<cr>", "Save and Close" },
			},
			e = {
				name = "Edit",
				f = { telescope.live_grep, "Find" },
				F = { "<cmd>NvimTreeFindFile<cr>", "Find File in Tree" },
				t = { telescope.treesitter, "Treesitter" },
				s = { telescope.grep_string, "Find String" },
				h = { "<cmd>noh<cr>", "Clear Highlight" },
				e = { "<cmd>set foldmethod=expr<cr>", "Enable folding" },
			},
			b = {
				name = "Buffer",
				f = { telescope.buffers, "Find Buffer" },
				n = {
					function()
						local bufname = vim.fn.input("new buffer> ")
						vim.cmd("e " .. bufname)
					end,
					"New Buffer",
				},
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
				r = { "<cmd>SnipRun<cr>", "SnipRun" },
				t = { "<cmd>ToggleTerm<cr>", "Terminal" },
				s = { "<cmd>Telescope builtin", "Telescope" },
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
			t = {
				name = "Tab",
				n = { "<cmd>tabnew<cr>", "New Tab" },
				d = { "<cmd>tabclose<cr>", "Close Tab" },
				["["] = { "<cmd>tabp<cr>", "Previous Tab" },
				["]"] = { "<cmd>tabnext<cr>", "Next Tab" },
			},
			v = {
				name = "View",
				F = { "<cmd>NvimTreeRefresh<cr>", "Refresh File Browser" },
				c = { "<cmd>ColorizerToggle<cr>", "Colorizer" },
				f = { "<cmd>NvimTreeToggle<cr>", "File Browser" },
				g = { "<cmd>Neogit<cr>", "Open Neogit" },
				k = { telescope.keymaps, "Keymaps" },
				m = { "<cmd>MarkdownPreview<cr>", "Preview Markdown" },
				s = { "<cmd>:set spell!<cr>", "Spell Check" },
				r = { "<cmd>set relativenumber!<cr>", "Relative Number" },
				o = { "<cmd>SymbolsOutline<cr>", "Outline" },
				u = { "<cmd>UndotreeToggle<cr>", "Undo Tree" },
				d = { diffview.open, "Toggle Diffview" },
				h = { diffview.file_history, "Open File History" },
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
		f = {
			w = { "<cmd>HopWord<cr>", "Hop Word" },
			W = { "<cmd>HopWordCurrentLine<cr>", "Hop Current Word" },
			l = { "<cmd>HopLine<cr>", "Hop Line" },
			n = { "<cmd>HopPattern<cr>", "Hop Line" },
			a = { "<cmd>HopAnywhere<cr>", "Hop Anywhere" },
			c = { "<cmd>HopChar1<cr>", "Hop One Character" },
			C = { "<cmd>HopChar1<cr>", "Hop Two Character" },
		},
		["<F6>"] = { ":up | :make<cr>", "Make" },
		["<F9>"] = { dap.toggle_breakpoint, "Toggle Breakpoint" },
		["<F5>"] = { dap.continue, "Continue" },
		["<F10>"] = { dap.step_over, "Step Over" },
		["<F11>"] = { dap.step_into, "Step Into" },
		["<F8>"] = { dap.step_back, "Step Back" },
		["<F23>"] = { dap.setp_out, "Step Out" }, -- Shift F11
		["<F29>"] = { dap.terminate, "Stop Debugging" }, -- Ctrl F5
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

	-- Window to close with Q
	autocmd(
		"FileType",
		{ pattern = { "help", "startuptime", "qf", "lspinfo" }, command = [[nnoremap <buffer><silent> q :close<CR>]] }
	)
	autocmd("FileType", { pattern = "man", command = [[nnoremap <buffer><silent> q :quit<CR>]] })
end

-- invoked when a language server was attached
function M.reg_lsp(bufnr)
	local provider = require("lspsaga.provider")
	local actoin = require("lspsaga.action")

	require("which-key").register({
		["<leader>"] = {
			c = {
				name = "Code",
				d = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Show Diagnostics" },
				a = { "<cmd>Lspsaga code_action<CR>", "Code Action" },
				n = { "<cmd>Lspsaga rename<cr>", "Rename" },
				f = { vim.lsp.buf.formatting_sync, "Format Documents" },
				F = { require("lsp.format").toggle, "Toggle Formatting" },
				t = { "<cmd>Trouble<cr>", "Trouble" },
				w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
				r = { "<cmd>Trouble lsp_references<cr>", "References" },
				q = { "<cmd>Trouble quickfix<cr>", "Quick Fix" },
				["["] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "Previous Diagnostic" },
				["]"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "Next Diagnostic" },
				s = { telescope.lsp_document_symbols, "Find Symbols" },
				S = { telescope.lsp_workspace_symbols, "Find Symbols (workspace)" },
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
				f = { telescope.git_files, "Files" },
				c = { telescope.git_bcommits, "Buffer Commits" },
				C = { telescope.git_commits, "All Commits" },
				s = { gitsigns.stage_hunk, "Stage Hunk" },
				r = { gitsigns.reset_hunk, "Reset Hunk" },
				u = { gitsigns.undo_stage_hunk, "Undo stage Hunk" },
				S = { gitsigns.stage_buffer, "Stage All Hunk" },
				R = { gitsigns.reset_buffer, "Unstage All Huck" },
				p = { gitsigns.preview_hunk, "Preview Hunk" },
				b = { ":GitBlameToggle<cr>", "Git Blame Line" },
				B = {
					function()
						gitsigns.blame_line({ full = true })
					end,
					"Full Blame",
				},
				x = { gitsigns.toggle_deleted, "Show Deleted" },
				d = { gitsigns.diffthis, "Show diff" },
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

function M.setup()
	M.reg_main()
end

return M
