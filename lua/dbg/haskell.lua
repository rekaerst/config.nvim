local dap = require("dap")

dap.adapters.haskell = {
	type = "executable",
	command = "haskell-debug-adapter",
}

dap.configurations.haskell = {
	{
		type = "haskell",
		request = "launch",
		name = "haskell(cabal)",
		workspace = "${workspaceFolder}",
		startup = "${workspaceFolder}/app/Main.hs",
		startupFunc = "",
		startupArgs = "",
		stopOnEntry = false,
		mainArgs = "",
		ghciPrompt = "λ> ",
		ghciInitialPrompt = "> ",
		ghciCmd = "cabal exec -- ghci-dap --interactive -i -i${workspaceFolder}/app/Main.hs",
		ghciEnv = vim.empty_dict(),
		logFile = vim.fn.stdpath("cache") .. "/haskell-dap.log",
		logLevel = "WARNING",
		forceInspect = false,
	},
}
