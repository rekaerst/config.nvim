local u = require 'utils'

u.signdef('DapBreakpoint', {
	text = '',
	texthl = 'Error'
})
u.signdef('DapBreakpointCondition', {
	text = '',
	texthl = 'Type'
})
u.signdef('DapStopped', {
	text = '',
	texthl = 'Function'
	-- linehl = 'Error'
})
u.signdef('DapBreakpointRejected', {
	text = '',
	texthl = 'Error'
})
