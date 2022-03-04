local lspconfig = require 'lspconfig'
local binding = require 'lsp.binding'
require "lsp.ui"

-- LSP Servers
local servers = { -- "pyright",
"jedi_language_server", "rust_analyzer", "tsserver", "clangd", 'cmake', "gopls", "bashls", 'gdscript', 'vala_ls', 'hls',
'cmake'}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = binding.on_attach,
		debounce_text_changes = 150,
		capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	}
end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = {
		spacing = 5,
		severity_limit = 'Warning'
	},
	update_in_insert = true
})
