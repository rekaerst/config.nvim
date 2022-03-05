local lspconfig = require 'lspconfig'
local binding = require 'lsp.binding'
require "lsp.ui"

-- LSP Servers
local servers = { -- "pyright",
"jedi_language_server", "jdtls", "rust_analyzer", "tsserver", "clangd", "html", "jsonls", 'cmake', "gopls", "bashls", 'gdscript',
'vala_ls', 'hls', 'cmake', 'cssls', 'sqls', 'r_language_server'}
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		on_attach = binding.on_attach,
		debounce_text_changes = 150,
		capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	}
end

-- this ass is too special...
require'lspconfig'.sumneko_lua.setup {
	on_attach = binding.on_attach,
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT'
			},
			completion = {
				keywordSnippet = "Disable",
				showWord = "Disable",
			},
			-- get the language server to recognize the 'vim' global
			diagnostics = {
				enable = true,
				globals = {'vim'}
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				maxPreload = 10000,
				preloadFileSize = 10000,
			},
			telemetry = {
				enable = false
			}
		}
	}
}

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = {
		spacing = 5,
		severity_limit = 'Warning'
	},
	update_in_insert = true
})
