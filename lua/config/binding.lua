local u = require('utils')
local wk = require 'which-key'

wk.register({
	['<leader>'] = {
		f = {
			name = "File",
			w = {':w<cr>', "Save Current File"},
			a = {':wa<cr>', "Save All Files"},
			x = {':wq', "Save and Close"},
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
			c = {':lua require"dap".continue()<cr>', "Continue"},
			o = {':lua require"dap".step_over()<cr>', "Step Over"},
			i = {':lua require"dap".step_into()<cr>', "Step Into"}
		},
		v = {
			name = "View",
			t = {':NvimTreeToggle<cr>', "File Browser"},
			T = {':NvimTreeRefresh<cr>', "Refresh File Browser"},
			g = {':IndentGuidesToggle<cr>', "Toggle Indent Guides"},
			e = {':if &ve == "all" | echo "disable venn " | set ve= | else | set ve=all | echo "enable venn" | endif | :IndentGuidesToggle | :lua Toggle_venn() <cr>',
        "Venn"},
			k = {'<cmd>Telescope keymaps<cr>', "Keymaps"}
		},
		h = {
			name = "Help",
			h = {':help<cr>', "Open Help"},
			f = {'<cmd>Telescope help_tags<cr>', "Find Help"}
		}
	},
	['<C-b'] = {':w | :make<cr>', "Make"},
	['<F9>'] = {':lua require"dap".toggle_breakpoint()<cr>', "Toggle Breakpoint"},
	['<F5>'] = {':lua require"dap".continue()<cr>', "Continue"},
	['<F10>'] = {':lua require"dap".step_over()<cr>', "Step Over"},
	['<F11>'] = {':lua require"dap".step_into()<cr>', "Step Into"}
}, {
	silent = true
})

u.imap('<C-a>', '<C-o>^')
u.imap('<C-e>', '<C-o>$')

