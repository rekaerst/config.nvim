local M = {}
local autocmd = vim.api.nvim_create_autocmd
local wk = require("which-key")

function M.reg_main()
	local dap = require("dap")
	local dapui = require("dapui")
	local bufdelete = require("bufdelete")

	wk.register({
		["<leader>"] = {
			f = {
				name = "File",
				r = { "<cmd>Telescope oldfiles<cr>", "Open Recent" },
				f = { "<cmd>Telescope find_files<cr>", "Find File" },
				w = { ":w<cr>", "Save Current File" },
				a = { ":wa<cr>", "Save All Files" },
				x = { ":wq<cr>", "Save and Close" },
			},
			e = {
				name = "Edit",
				f = { "<cmd>Telescope live_grep<cr>", "Find" },
				F = { "<cmd>NvimTreeFindFile<cr>", "Find File in Tree" },
				t = { "<cmd>Telescope treesitter<cr>", "Treesitter" },
				s = { "<cmd>Telescope grep_string<cr>", "Find String" },
				h = { "<cmd>noh<cr>", "Clear Highlight" },
				e = { "<cmd>set foldmethod=expr<cr>", "Enable folding" },
			},
			b = {
				name = "Buffer",
				f = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
				n = {
					function()
						local bufname = vim.fn.input("new buffer> ")
						if bufname == "" then
							vim.api.nvim_err_writeln("buffer name required")
							return
						end
						vim.cmd("e " .. bufname)
					end,
					"New Buffer",
				},
				d = {
					function()
						if vim.fn.getbufinfo(vim.api.nvim_buf_get_number(0))[1].changed == 1 then
							vim.api.nvim_err_writeln("buffer changed")
						else
							bufdelete.bufdelete(0, false)
						end
					end,
					"Delete Buffer",
				},
				D = {
					function()
						bufdelete.bufdelete(0, true)
					end,
					"Force Delete Buffer",
				},
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
				t = { "<cmd>ToggleTerm<cr>", "Toggle Terminal" },
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
				R = { "<cmd>NvimTreeRefresh<cr>", "Refresh File Browser" },
				c = { "<cmd>ColorizerToggle<cr>", "Colorizer" },
				f = { "<cmd>NvimTreeFocus<cr>", "File Browser" },
				F = { "<cmd>NvimTreeToggle<cr>", "Toggle File Browser" },
				g = { "<cmd>Neogit<cr>", "Open Neogit" },
				k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
				t = { "<cmd>Telescope<cr>", "Telescope" },
				q = { "<cmd>Trouble<cr>", "Trouble" },
				m = { "<cmd>MarkdownPreview<cr>", "Preview Markdown" },
				s = { "<cmd>:setlocal spell!<cr>", "Spell Check" },
				r = { "<cmd>set relativenumber!<cr>", "Relative Number" },
				o = { "<cmd>SymbolsOutline<cr>", "Outline" },
				u = { "<cmd>UndotreeToggle<cr>", "Undo Tree" },
				d = { "<cmd>DiffviewOpen<cr>", "Toggle Diffview" },
				h = { "<cmd>DiffviewFileHistory<cmd>", "Open File History" },
			},
			h = {
				name = "Misc",
				h = { "<cmd>help<cr>", "Open Help" },
				f = { "<cmd>Telescope help_tags<cr>", "Find Help" },
				d = {
					function()
						require("osv").launch({ port = 7058 })
					end,
					"Debug Neovim",
				},
				p = { "<cmd>Luapad<cr>", "Launch Luapad" },
				c = { "<cmd>LuaCacheClear<cr>", "Clean Cache" },
				s = { "<cmd>StartupTime<cr>", "Startup Time" },
			},
			w = {
				name = "Window",
				h = { "<cmd>WinShift left<cr>", "Move Left" },
				j = { "<cmd>WinShift down<cr>", "Move Down" },
				k = { "<cmd>WinShift up<cr>", "Move Up" },
				l = { "<cmd>WinShift right<cr>", "Move Right" },
				s = { "<cmd>WinShift swap<cr>", "Swap" },
			},
			y = {
				name = "System Clipboard",
				y = { '"+yy', "Yank" },
				d = { '"+d', "Cut" },
				p = { '"+p', "Paste after" },
				P = { '"+P', "Paste before" },
			},
			["<C-q>"] = { ":qa!<cr>", "Quit" },
			["?"] = { "<cmd>Cheatsheet<cr>", "Cheat Sheet" },
		},
		[";"] = {
			w = { "<cmd>HopWord<cr>", "Hop Word" },
			W = { "<cmd>HopWordCurrentLine<cr>", "Hop Current Word" },
			l = { "<cmd>HopLine<cr>", "Hop Line" },
			n = { "<cmd>HopPattern<cr>", "Hop Line" },
			a = { "<cmd>HopAnywhere<cr>", "Hop Anywhere" },
			c = { "<cmd>HopChar2<cr>", "Hop Two Character" },
			C = { "<cmd>HopChar1<cr>", "Hop One Character" },
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
			y = {
				name = "System Clipboard",
				y = { '"+y', "Yank" },
				d = { '"+d', "Cut" },
				p = { '"+p', "Paste after" },
				P = { '"+P', "Paste before" },
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
	if vim.b.lsp_registered then
		return
	end
	vim.b.lsp_registered = true

	local gp = require("goto-preview")
	wk.register({
		["<leader>"] = {
			c = {
				name = "Code",
				D = {
					function()
						vim.diagnostic.open_float({ border = "single" })
					end,
					"Show Diagnostics",
				},
				a = { vim.lsp.buf.code_action, "Code Action" },
				n = { vim.lsp.buf.rename, "Rename" },
				f = { vim.lsp.buf.formatting, "Format Documents" },
				F = { require("lsp.format").toggle, "Toggle Formatting" },
				d = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
				r = { "<cmd>Trouble lsp_references<cr>", "References" },
				q = { "<cmd>Trouble quickfix<cr>", "Quick Fix" },
				["["] = {
					function()
						vim.diagnostic.goto_prev({ float = { border = "single" } })
					end,
					"Previous Diagnostic",
				},
				["]"] = {
					function()
						vim.diagnostic.goto_next({ float = { border = "single" } })
					end,
					"Next Diagnostic",
				},
				s = { "<cmd>Telescope lsp_document_symbols<cr>", "Find Symbols" },
				S = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Find Symbols (workspace)" },
			},
		},
		g = {
			name = "Go",
			f = { vim.lsp.buf.declaration, "Go to Declaration" },
			d = { "<cmd>Trouble lsp_definitions<cr>", "Go to Definition" },
			i = { "<cmd>Trouble lsp_implementations<cr>", "Go to Implementation" },
			r = { "<cmd>Trouble lsp_references<cr>", "References" },
			s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
			o = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols" },
			p = {
				name = "Preview",
				d = { gp.goto_preview_definition, "Preview Definition" },
				r = { gp.goto_preview_references, "Preview References" },
				i = { gp.goto_preview_implementation, "Preview Implementation" },
				c = { gp.close_all_win, "Close All Preview" },
				m = { gp.dismiss_preview, "Dismiss Preview" },
			},
		},
		K = { vim.lsp.buf.hover, "Hover" },
	}, { buffer = bufnr })
end

-- invoked only when cwd is a git repo
function M.reg_git(bufnr)
	if vim.b.git_registered then
		return
	end
	vim.b.git_registered = true

	local gitsigns = package.loaded.gitsigns
	wk.register({
		["<leader>"] = {
			g = {
				name = "Git",
				f = { "<cmd>Telescope git_files<cr>", "Files" },
				c = { "<cmd>Telescope git_bcommits<cr>", "Buffer Commits" },
				C = { "<cmd>Telescope git_commits<cr>", "All Commits" },
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
				s = { gitsigns.stage_hunk, "Stage Hunk" },
				r = { gitsigns.reset_hunk, "Reset Hunk" },
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
