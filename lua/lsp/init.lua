local fmt = require("lsp.format")

local signdef = vim.fn.sign_define

local M = {}

function M.on_attach(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	require("core.mapping").reg_lsp(bufnr)

	fmt.on_attach(client, bufnr)
end

function M.setup()
	signdef("DiagnosticSignError", {
		text = "",
		texthl = "DiagnosticError",
	})
	signdef("DiagnosticSignWarn", {
		text = "",
		texthl = "DiagnosticWarn",
	})
	signdef("DiagnosticSignHint", {
		text = "",
		texthl = "DiagnosticHint",
	})
	signdef("DiagnosticSignInfo", {
		text = "",
		texthl = "DiagnosticInfo",
	})

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "single",
	})

	require("lsp.server").setup(M.on_attach)
	require("lsp.null_ls").setup(M.on_attach)
end

return M
