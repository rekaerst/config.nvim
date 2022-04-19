local signdef = vim.fn.sign_define

local M = {}

function M.setup()
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
		-- linehl = 'Error'
	})
	signdef("DapBreakpointRejected", {
		text = "",
		texthl = "Error",
	})
end

return M
