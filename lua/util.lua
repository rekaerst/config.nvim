local util = {}

local script_dir = vim.env.XDG_CONFIG_HOME .. "/nvim/viml/"

function util.hi(token, fg)
	vim.cmd('hi ' .. token .. ' guifg=' .. fg)
end

return util
