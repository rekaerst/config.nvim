local util = {}

local script_dir = vim.env.XDG_CONFIG_HOME .. '/nvim/lua/'

function util.source(srcript)
	vim.cmd('source ' .. script_dir .. srcript .. '.vim')
end

function util.hi(token, fg)
	vim.cmd('hi ' .. token .. ' guifg=' .. fg)
end

function util.nmap(lh, rh)
	vim.api.nvim_set_keymap('n',lh,rh, {noremap = true, silent = true})
end

function util.imap(lh, rh)
	vim.api.nvim_set_keymap('i',lh,rh, {silent = true})
end

function util.map(lh, rh)
	util.nmap(lh, rh)
	util.imap(lh, '<ESC>' .. rh .. 'i')
end

return util
