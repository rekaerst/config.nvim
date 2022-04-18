local u = require("core.util")

local M = {}

function M.setup()
	u.signdef("DapBreakpoint", {
		text = "",
		texthl = "DiagnosticError",
	})
	u.signdef("DapBreakpointCondition", {
		text = "",
		texthl = "Type",
	})
	u.signdef("DapStopped", {
		text = "",
		texthl = "Function",
		-- linehl = 'Error'
	})
	u.signdef("DapBreakpointRejected", {
		text = "",
		texthl = "Error",
	})
end

return M
