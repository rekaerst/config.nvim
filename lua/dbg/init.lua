local dap = require('dap')
local u = require('utils')

dap.adapters.lldb = {
	type = 'executable',
	command = '/usr/bin/lldb-vscode', -- adjust as needed
	name = "lldb"
}

u.map('<F9>', ':lua require"dap".toggle_breakpoint()<cr>')
u.map('<F5>', ':lua require"dap".continue()<cr>')
require('dbg.lldb')
