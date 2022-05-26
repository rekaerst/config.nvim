local lspconfig = require("lspconfig")

-- LSP Servers
local servers = {
	"bashls",
	"cmake",
	"cssls",
	"gdscript",
	"gopls",
	"hls",
	"html",
	"jsonls",
	"jedi_language_server",
	"r_language_server",
	"texlab",
	"tsserver",
	"vala_ls",
	"vimls",
	"yamlls",
}

local settings = {
	gopls = {
		analyses = {
			unusedparams = true,
		},
		staticcheck = true,
	},
}

local single_file_support = {
	bashls = true,
	tsserver = true,
	gopls = true,
	html = true,
	jsonls = true,
	vala_ls = true,
	yamlls = true,
}

local init_options = {
	tsserver = {
		hostInfo = "neovim",
		preferences = {
			includeCompletionsWithSnippetText = true,
			includeCompletionsForImportStatements = true,
		},
	},
}

local M = {}

M.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- HACK: #428
M.capabilities.offsetEncoding = { "utf-16" }
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

function M.setup(on_attach)
	-- setup language servers
	for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup({
			on_attach = on_attach,
			debounce_text_changes = 150,
			capabilities = M.capabilities,
			single_file_support = single_file_support[lsp] or nil,
			init_options = init_options[lsp] or nil,
			settings = settings,
		})
	end
end

return M
