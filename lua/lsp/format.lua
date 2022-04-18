local u = require("core.util")
local M = {
	disabled = false,
}

local aggressive_ft = { "c", "cpp", "lua" }

function M._format()
	if M.disabled then
		return
	end

	vim.lsp.buf.formatting_sync()
end

function M.on_attach(client, bufnr)
	vim.cmd([[autocmd BufWritePre <buffer> lua require("lsp.format")._format()]])
	if u.has_value(aggressive_ft, vim.bo.filetype) then
		vim.cmd([[autocmd InsertLeave <buffer> lua require("lsp.format")._format()]])
	end
end

function M.disable()
	M.disabled = true
end

function M.enable()
	M.disabled = false
end

function M.toggle()
	M.disabled = not M.disabled
end

return M
