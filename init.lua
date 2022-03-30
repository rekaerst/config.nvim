local present, impatient = pcall(require, "impatient")
if present then
	impatient.enable_profile()
end

require("plugin")
require("core.internal")
require("core.mapping").reg_main()
require("lsp")
require("dbg")
require("color")
