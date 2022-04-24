pcall(require, "impatient")

require("plugin")
require("core.internal").setup()
require("core.mapping").setup()
require("lsp").setup()
require("color").setup()
