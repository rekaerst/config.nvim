local dap = require 'dap'

require'dap.ext.vscode'.load_launchjs()
require 'dbg.ui'

dap.adapters.lldb = {
	type = 'executable',
	command = '/usr/bin/lldb-vscode', -- adjust as needed
	name = "lldb"
}

require 'dbg.lldb'
require 'dbg.nvim-lua'
require 'dap-go'.setup()
require 'dap-python'.setup('/usr/bin/python')

vim.cmd [[au FileType dap-repl lua require('dap.ext.autocompl').attach()]]
