-- don't run configurations for vscode-neovim
if vim.g.vscode then
	return
end

pcall(require, "impatient")

require("plugin")
require("core.option").setup()
require("core.filetype").setup()
require("core.mapping").setup()
require("color").setup()
