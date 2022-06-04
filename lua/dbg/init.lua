local dap = require("dap")

local signdef = vim.fn.sign_define

local M = {}

function M.setup()
	-- TODO: make this work with dapui
	-- dap.defaults.fallback.terminal_win_cmd = "12sp new"
	dap.defaults.fallback.external_terminal = { command = "/usr/bin/foot" }

	signdef("DapBreakpoint", {
		text = "",
		texthl = "DiagnosticError",
	})
	signdef("DapBreakpointCondition", {
		text = "",
		texthl = "Type",
	})
	signdef("DapStopped", {
		text = "",
		texthl = "Function",
		linehl = "DapStopped",
		-- linehl = 'Error'
	})
	signdef("DapBreakpointRejected", {
		text = "",
		texthl = "Error",
	})

	require("dbg.nvim-lua").setup()
	require("dbg.lldb").setup()
	require("dap-go").setup()
	require("dap-python").setup("/usr/bin/python", nil)
end

return M
