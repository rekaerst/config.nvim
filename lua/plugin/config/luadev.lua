local luadev = require("lua-dev").setup({
	lspconfig = {
		on_attach = function(client, bufnr)
			client.resolved_capabilities.document_formatting = false
			require("lsp").on_attach(client, bufnr)
		end,
	},
})

require("lspconfig").sumneko_lua.setup(luadev)
