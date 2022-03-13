local dap = require 'dap'

require 'dbg.ui'

dap.defaults.fallback.terminal_win_cmd = '12sp new'
dap.defaults.fallback.external_terminal = { command = '/usr/bin/foot' }

require 'dbg.lldb'
require 'dbg.haskell'
require 'dbg.nvim-lua'
require 'dap-go'.setup()
require 'dap-python'.setup('/usr/bin/python')
