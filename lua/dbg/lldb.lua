local dap = require("dap")
local u = require("core.util")

local M = {}
function M.setup()
	dap.adapters.lldb = {
		type = "executable",
		command = "/usr/bin/lldb-vscode", -- adjust as needed
		name = "lldb",
	}

	dap.configurations.cpp = {
		{
			name = "lldb",
			type = "lldb",
			request = "launch",
			program = function()
				-- json schema: {"dap":{"program": "string"}}
				local path = vim.fn.getcwd() .. "/.nvim.json"
				local program = nil
				local content = u.read_json(path)

				pcall(function()
					program = content.dap.program
				end)
				if not program then
					program = vim.fn.input("Name of executable: ")
					if program == "" then
						vim.api.nvim_err_writeln("program name required")
						return
					end
					-- TODO: implement a proper setcfg function
					content.dap = { program = program }
					u.write_json(path, content)
				end
				return vim.fn.getcwd() .. "/" .. program
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
			args = {},
			env = function()
				-- inherit environment variables
				local variables = {}
				for k, v in pairs(vim.fn.environ()) do
					table.insert(variables, string.format("%s=%s", k, v))
				end
			end,

			runInTerminal = true,
		},
	}

	dap.configurations.c = dap.configurations.cpp
	dap.configurations.vala = dap.configurations.cpp
end

return M
