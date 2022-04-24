local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local u = require("core.util")

local M = {
	disabled = false,
}

local aggressive_ft = { "c", "cpp", "lua", "go", "rust" }

---@diagnostic disable-next-line: unused-local
function M.on_attach(client, bufnr)
	-- clear existing commands of the group
	local lsp_fmt_grp = augroup("LspFormat", { clear = true })
	autocmd("BufWritePre", { group = lsp_fmt_grp, buffer = bufnr, callback = M.formatting_sync })
	if u.has_value(aggressive_ft, vim.bo.filetype) then
		autocmd("InsertLeave", { group = lsp_fmt_grp, buffer = bufnr, callback = M.formatting })
	end
end

function M.formatting()
	if M.disabled then
		return
	end
	vim.lsp.buf.formatting()
end

function M.formatting_sync()
	if M.disabled then
		return
	end
	vim.lsp.buf.formatting_sync()
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
