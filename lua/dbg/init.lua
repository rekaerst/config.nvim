local dap, dapui = require("dap"), require("dapui")

require 'dbg.ui'

dap.adapters.lldb = {
	type = 'executable',
	command = '/usr/bin/lldb-vscode', -- adjust as needed
	name = "lldb"
}
dap.defaults.fallback.terminal_win_cmd = '12sp new'
dap.defaults.fallback.external_terminal = { command = '/usr/bin/foot' }

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require 'dbg.lldb'
require 'dbg.nvim-lua'
require 'dap-go'.setup()
require 'dap-python'.setup('/usr/bin/python')
