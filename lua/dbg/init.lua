local dap = require("dap")

local M = {}
function M.setup()
	require("dbg.ui").setup()
	dap.defaults.fallback.terminal_win_cmd = "12sp new"
	dap.defaults.fallback.external_terminal = { command = "/usr/bin/foot" }
	require("dap-go").setup()
	require("dbg.nvim-lua").setup()
	require("dbg.lldb").setup()
	require("dap-python").setup("/usr/bin/python")
end

return M
