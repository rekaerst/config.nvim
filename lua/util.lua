local util = {}

local script_dir = vim.env.XDG_CONFIG_HOME .. "/nvim/viml/"

function util.source(module)
	vim.cmd("source " .. script_dir .. module .. ".vim")
end

function util.hi(token, fg)
	vim.cmd('hi ' .. token .. ' guifg=' .. fg)
end

return util
