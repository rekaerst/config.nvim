local lspformat = require("lsp-format")
local u = require("core.util")
local nonaggressive_format = { "markdown" }

local M = {}

lspformat.setup({})

function M._format()
	if not lspformat.disabled then
		vim.lsp.buf.formatting_sync()
	end
end

function M.on_attach(client)
	if u.has_value(nonaggressive_format, vim.bo.filetype) then
		lspformat.on_attach(client)
	else
		lspformat.on_attach(client)
		vim.cmd([[autocmd InsertLeave <buffer> lua require("lsp.format")._format()]])
	end
end

return M
