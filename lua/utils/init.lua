local utils = {}

local script_dir = vim.env.XDG_CONFIG_HOME .. "/nvim/"

function utils.source(module)
	vim.cmd("source " .. script_dir .. module .. ".vim")
end

return utils
