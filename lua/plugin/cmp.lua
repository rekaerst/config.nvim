local cmp = require("cmp")

local autorefresh_blacklist = { "bashls" }

local M = {}

local function refresh()
	if cmp.visible() then
		local entry = cmp.get_entries()[1]
		if #entry.matches == 0 then
			cmp.complete()
		end
	end
end

function M.auto_refresh(client, bufnr)
	if not vim.tbl_contains(autorefresh_blacklist, client.name) then
		vim.api.nvim_create_autocmd({ "TextChangedI" }, {
			callback = function()
				vim.defer_fn(refresh, 0)
			end,
			buffer = bufnr,
		})
	end
end

return M
