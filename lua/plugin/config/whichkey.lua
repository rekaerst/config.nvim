local wk = require("which-key")
local show = wk.show
wk.show = function(keys, opts)
	if vim.bo.filetype == "TelescopePrompt" then
		return
	end
	show(keys, opts)
end

wk.setup({
	plugins = {
		spelling = {
			enabled = true,
			suggestions = 24,
		},
	},
})

require("core.mapping").setup()
