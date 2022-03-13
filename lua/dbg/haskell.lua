dap = require'dap'

dap.adapters.haskell = {
	type = 'executable';
	command = 'haskell-debug-adapter';
}

dap.configurations.haskell = {{
	type = 'haskell',
	request = 'launch',
	name = 'haskell(cabal)',
	workspace = '${workspaceFolder}',
	startup = "${workspaceFolder}/app/Main.hs",
	stopOnEntry = false,
	logFile = vim.fn.stdpath('cache') .. '/haskell-dap.log',
	logLevel = 'WARNING',
	ghciEnv = vim.empty_dict(),
	ghciPrompt = "λ: ",
	ghciInitialPrompt = "λ: ",
	ghciCmd = "cabal exec -- ghci-dap --interactive -i -i${workspaceFolder}",
}}
