local lspconfig = require("lspconfig")
local u = require("core.util")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- TODO: remove this after offset encoding issue is fixed
capabilities.offsetEncoding = { "utf-18" }
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- LSP Servers
local servers = {
	"bashls",
	"clangd",
	"cmake",
	"cssls",
	"gdscript",
	"gopls",
	"hls",
	"html",
	"jsonls",
	"jedi_language_server",
	"r_language_server",
	"rust_analyzer",
	"texlab",
	"tsserver",
	"vala_ls",
	"vimls",
	"yamlls",
}

local function override_single_file(lsp)
	local sf = {
		"bashls",
		"tsserver",
		"gopls",
		"html",
		"jsonls",
		"vala_ls",
		"yamlls",
	}
	if u.has_value(sf, lsp) then
		return true
	else
		return nil
	end
end

local M = {}

function M.setup(on_attach)
	-- setup language servers
	for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup({
			on_attach = on_attach,
			debounce_text_changes = 150,
			capabilities = capabilities,
			single_file_support = override_single_file(lsp),
		})
	end

	-- Update diagnostics while inserting
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics,
		{ update_in_insert = true }
	)
end

return M
