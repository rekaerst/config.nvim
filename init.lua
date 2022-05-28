-- vscode-neovim extension
if vim.g.vscode then
	vim.opt.loadplugins = false
	require("vscode").setup()
	return
end
pcall(require, "impatient")

require("plugin")
require("core.option").setup()
require("core.filetype").setup()
require("core.mapping").setup()
require("color").setup()
require("term").setup()
