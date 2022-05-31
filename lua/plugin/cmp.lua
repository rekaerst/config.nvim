local cmp = require("cmp")

local autorefresh_blacklist = { "bashls" }

local M = {}

function M.auto_refresh(client, bufnr)
	local refresh_count = 0
	local refresh = true

	if not vim.tbl_contains(autorefresh_blacklist, client.name) then
		vim.api.nvim_create_autocmd({ "TextChangedI" }, {
			callback = function()
				vim.defer_fn(function()
					if cmp.visible() then
						local entry = cmp.get_entries()[1]
						if #entry.matches == 0 and refresh then
							refresh_count = refresh_count + 1
							if refresh_count >= 3 then
								refresh = false
							end
							cmp.complete()
						end
					else
						refresh_count = 0
						refresh = true
					end
				end, 0)
			end,
			buffer = bufnr,
		})
	end
end

return M
