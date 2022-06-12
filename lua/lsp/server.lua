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

local override = {
	gopls = {
		settings = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
	tsserver = {
		single_file_support = true,
		init_options = {
			hostInfo = "neovim",
			preferences = {
				includeCompletionsWithSnippetText = true,
				includeCompletionsForImportStatements = true,
			},
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
		local config = {
			on_attach = on_attach,
			debounce_text_changes = 150,
			capabilities = M.capabilities,
		}
		config = vim.tbl_extend("force", config, override[lsp] or {})
		lspconfig[lsp].setup(config)
	end
end

return M
