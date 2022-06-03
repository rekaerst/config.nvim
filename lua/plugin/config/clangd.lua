require("clangd_extensions").setup({
	server = {
		on_attach = require("lsp").on_attach,
		capabilities = require("lsp.server").capabilities,
		filetypes = { "c", "cpp", "cuda" },
	},
})
