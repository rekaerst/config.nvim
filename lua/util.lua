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

---
--- Nmap with leader key
---
function util.lmap(lh, rh)
	vim.api.nvim_set_keymap('n','<leader>' .. lh,rh, {noremap = true, silent = true})
end

function util.imap(lh, rh)
	vim.api.nvim_set_keymap('i',lh,rh, {silent = true})
end

---
--- map to both normal mode and insert mode
---
function util.map(lh, rh)
	util.nmap(lh, rh)
	util.imap(lh, '<ESC>' .. rh .. 'i')
end


function util.plugin_loaded(plugin_name)
	return packer_plugins[plugin_name] and packer_plugins[plugin_name].loaded
end

---
--- load lua module only if the corresponding plugin is loaded
---
function util.config(module)
	if util.plugin_loaded(module) or util.plugin_loaded(module .. '.nvim') then
		require(module)
	end
end

return util
