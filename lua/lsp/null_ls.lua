local null_ls = require("null-ls")

local M = {}

function M.setup(on_attach)
	null_ls.setup({
		debounce = 500,
		on_attach = on_attach,
		log = {
			level = "error",
		},
		sources = {
			null_ls.builtins.code_actions.shellcheck,
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.yapf, -- python
			null_ls.builtins.formatting.markdownlint,
			null_ls.builtins.formatting.buf, -- protobuf
			null_ls.builtins.diagnostics.codespell,
			null_ls.builtins.diagnostics.flake8,
			null_ls.builtins.diagnostics.shellcheck,
			null_ls.builtins.diagnostics.markdownlint,
		},
	})
end

return M
