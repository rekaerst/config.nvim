local null_ls = require("null-ls")
local format = require("lsp.format")

local M = {}
function M.setup()
	null_ls.setup({
		debounce = 500,
		on_attach = format.on_attach,
		log = {
			level = "error",
		},
		sources = {
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.yapf,
			null_ls.builtins.diagnostics.codespell,
			null_ls.builtins.diagnostics.flake8,
			null_ls.builtins.diagnostics.markdownlint,
			null_ls.builtins.formatting.markdownlint,
			null_ls.builtins.formatting.buf,
		},
	})
end

return M
