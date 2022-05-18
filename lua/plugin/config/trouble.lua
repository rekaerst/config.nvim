-- HACK: #153 Go to definition does not work for neovim >= 0.7
local trouble_util = require("trouble.util")
local jump_to_item = trouble_util.jump_to_item
trouble_util.jump_to_item = function(win, precmd, item)
	if win == nil then
		win = 0
	end
	jump_to_item(win, precmd, item)
end

require("trouble").setup({
	action_keys = {
		open_split = { "<c-s>" },
	},
	use_diagnostic_signs = true,
})
