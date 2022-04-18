local present, impatient = pcall(require, "impatient")
if present then
	impatient.enable_profile()
end

require("plugin")
require("core.internal").setup()
require("core.mapping").setup()
require("lsp")
require("dbg").setup()
require("color").setup()
