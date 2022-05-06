local lsp = require("lsp")

require("rust-tools").setup({
	server = {
		on_attach = lsp.on_attach,
		debounce_text_changes = 150,
		capabilities = lsp.capabilities,
	},
})
