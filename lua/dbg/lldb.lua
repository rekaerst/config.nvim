local dap = require('dap')

dap.adapters.cpp = {
	type = 'executable',
	attach = {
		pidProperty = 'pid',
		pidSelect = 'ask',
	},
	command = 'lldb-vscode',
	env = {
		LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
	},
	name = 'lldb',
}

  dap.configurations.cpp = {
    {
      type = "cpp",
      name = "Debug",
      request = "launch",
      program = "a.out",
	  cwd = vim.fn.getcwd(),
	  externalConsole = true,
    }
  }

dap.adapters.c = {
	type = 'executable',
	attach = {
		pidProperty = 'pid',
		pidSelect = 'ask',
	},
	command = 'lldb-vscode',
	env = {
		LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
	},
	name = 'lldb',
}

  dap.configurations.c = {
    {
      type = "cpp",
      name = "Debug",
      request = "launch",
      program = "a.out",
	  cwd = vim.fn.getcwd(),
	  externalConsole = true,
    }
  }
