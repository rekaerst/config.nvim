local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local u = require("core.util")

local M = {
	disabled = false,
}

local aggressive_ft = { "c", "cpp", "lua", "javascript", "go", "rust" }

---@diagnostic disable-next-line: unused-local
function M.on_attach(client, bufnr)
	-- clear existing commands of the group
	local lsp_fmt_grp = augroup("lsp_fmt_" .. tostring(bufnr), { clear = true })
	autocmd("BufWritePre", { group = lsp_fmt_grp, buffer = bufnr, callback = M.formatting_sync })
	if u.has_value(aggressive_ft, vim.bo.filetype) then
		autocmd("InsertLeave", { group = lsp_fmt_grp, buffer = bufnr, callback = M.formatting })
	end
	autocmd("BufDelete", {
		group = lsp_fmt_grp,
		buffer = bufnr,
		callback = function()
			vim.api.nvim_del_augroup_by_id(lsp_fmt_grp)
		end,
	})
end

function M.formatting()
	-- jump_active: prevent formatting document when luasnip is active, as it cause
	-- problem with jumping
	if M.disabled or require("luasnip.session").jump_active then
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
