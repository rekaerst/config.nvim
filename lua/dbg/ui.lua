local u = require("core.util")

u.signdef("DapBreakpoint", {
	text = "",
	texthl = "Error",
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
