local u = require('utils')
local wk = require 'which-key'

-- silent
wk.register({
	['<leader>'] = {
		f = {
			name = "File",
			w = {':w<cr>', "Save Current File"},
			a = {':wa<cr>', "Save All Files"},
			x = {':wq<cr>', "Save and Close"},
			r = {
				"<cmd>Telescope oldfiles<cr>",
				"Open Recent File",
				noremap = false
			},
			f = {'<cmd>Telescope find_files<cr>', "Find File"},
			g = {'<cmd>Telescope gitfiles<cr>', "Git Files"}
		},
		e = {
			name = "Edit",
			f = {'<cmd>Telescope live_grep<cr>', "Find"},
			t = {'<cmd>Telescope treesitter<cr>', "Treesitter"},
			s = {'<cmd>Telescope grep_string<cr>', "Find String"}
		},
		b = {
			name = "Buffer",
			f = {'<cmd>Telescope buffers<cr>', "Find Buffer"},
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
			b = {':lua require"dap".toggle_breakpoint()<cr>', "Toggle Breakpoint"},
			B = {':lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', "Conditional BreakPoint"},
			c = {':lua require"dap".continue()<cr>', "Continue"},
			o = {':lua require"dap".step_over()<cr>', "Step Over"},
			O = {':lua require"dap".step_out()<cr>', "Step Out"},
			i = {':lua require"dap".step_into()<cr>', "Step Into"},
			r = {':lua require"dap".repl.open()<cr>', "Open Debug REPL"},
			t = {':lua require"dap".terminate()<cr>', "Stop Debugging"},
			g = {':lua require"dap".run_to_cursor()<cr>', "Run to Cursor"},
			G = {':lua require"dap".goto_()<cr>', "Goto Cursor"},
			u = {':lua require"dapui".toggle()<cr>', "Toggle Debug UI"}
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
			k = {'<cmd>Telescope keymaps<cr>', "Keymaps"},
			n = {'<cmd>set relativenumber!<cr>', "Relative Number"},
			m = {'<cmd>MarkdownPreview<cr>', "Preview Markdown"}
		},
		h = {
			name = "Help",
			h = {':help<cr>', "Open Help"},
			f = {'<cmd>Telescope help_tags<cr>', "Find Help"},
			d = {':lua require"osv".launch()<cr>', "Debug Neovim"}
		},
	},
	g = {
		b = "Block Comment",
 	 	c = "Line Comment",
	},
	['<F6>'] = {':w | :make<cr>', "Make"},
	['<F9>'] = {':lua require"dap".toggle_breakpoint()<cr>', "Toggle Breakpoint"},
	['<F5>'] = {':lua require"dap".continue()<cr>', "Continue"},
	['<F10>'] = {':lua require"dap".step_over()<cr>', "Step Over"},
	['<F11>'] = {':lua require"dap".step_into()<cr>', "Step Into"},
	['<F23>'] = {':lua require"dap".setp_out()<cr>', "Step Out"},
	['<F29>'] = {':lua require"dap".terminate()<cr>', "Stop Debugging"},
}, {silent = true,})

u.imap('<C-a>', '<C-o>^')
u.imap('<C-e>', '<C-o>$')

