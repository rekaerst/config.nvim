local lspconfig = require("lspconfig")
local lspformat = require("lsp-format")
local u = require("core.util")
lspformat.setup({})

local nonaggressive_format = { "markdown" }

lspformat.on_attach = function(client)
	if client.resolved_capabilities.document_formatting then
		if u.has_value(nonaggressive_format, vim.bo.filetype) then
			vim.cmd([[
				augroup Format
				autocmd! * <buffer>
				autocmd BufWritePost <buffer> lua require'lsp-format'.format()
				augroup END
			]])
		else
			vim.cmd([[
				augroup Format
				autocmd! * <buffer>
				autocmd BufWritePost <buffer> lua require'lsp-format'.format()
				autocmd InsertLeave <buffer> lua vim.lsp.buf.formatting_sync()
				augroup END
			]])
		end
	end
end

local reg = require("core.mapping").reg_lsp

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	lspformat.on_attach(client)
	reg(bufnr)
end

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
}

-- EFM
lspconfig.efm.setup({
	on_attach = lspformat.on_attach,
	init_options = { documentFormatting = true },
	settings = {
		rootMarkers = { ".git/" },
		languages = {
			lua = {
				{ formatCommand = "stylua -", formatStdin = true },
			},
			python = {
				{ formatCommand = "yapf --quiet", formatStdin = true },
			},
			markdown = {
				{ formatCommand = "prettier --parser markdown" },
			},
		},
	},
	filetypes = {
		"python",
		"lua",
		"markdown",
	},
})

-- lua
-- this ass is too special...
local luadev = require("lua-dev").setup({
	lspconfig = {
		on_attach = function(client)
			client.resolved_capabilities.document_formatting = false
			on_attach(client)
		end,
	},
})
lspconfig.sumneko_lua.setup(luadev)

-- Update diagnostics while inserting
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = {
		spacing = 5,
		severity_limit = "Warning",
	},
	update_in_insert = true,
})

-- setup language servers
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		debounce_text_changes = 150,
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
	})
end

-- disable lspformat when using python
vim.cmd([[au FileType python :FormatDisable]])
