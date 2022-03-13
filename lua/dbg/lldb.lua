local dap = require('dap')
local u = require('utils')

dap.adapters.lldb = {
	type = 'executable',
	command = '/usr/bin/lldb-vscode', -- adjust as needed
	name = "lldb"
}

dap.configurations.cpp = {{
	name = "lldb",
	type = "lldb",
	request = "launch",
	program = function()
		-- json schema: {"dap":{"program": "string"}}
		local path = vim.fn.getcwd() .. '/.nvim.json'
		local program = nil
	 	local content = u.readcfg(path)
	 		
		pcall(function() program = content.dap.program end)
		if not program then
			program = vim.fn.input('Name of executable: ')
			-- TODO: implement a proper setcfg function
			content.dap = {program = program}
			u.writecfg(path, content)
		end
		return vim.fn.getcwd() .. '/' .. program
	end,
	cwd = '${workspaceFolder}',
	stopOnEntry = false,
	args = {},

	runInTerminal = true,
}}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
