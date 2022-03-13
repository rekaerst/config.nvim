local M = {}

local opts = {
	noremap = true,
	silent = true
}

M.kind_symbols = {
	Text = '',
	Method = '',
	Function = '',
	Constructor = '',
	Field = '',
	Variable = '',
	Class = 'פּ',
	Interface = '',
	Module = '',
	Property = '',
	Unit = 'ﭧ',
	Value = '',
	Enum = '',
	Keyword = '',
	Snippet = '',
	Color = '',
	File = '',
	Folder = '',
	EnumMember = '',
	Constant = '',
	Struct = '',
	Event = '鬒',
	Operator = '',
	TypeParameter = ''
}
local kind_order = {'Text', 'Method', 'Function', 'Constructor', 'Field', 'Variable', 'Class', 'Interface', 'Module',
                    'Property', 'Unit', 'Value', 'Enum', 'Keyword', 'Snippet', 'Color', 'File', 'Reference', 'Folder',
                    'EnumMember', 'Constant', 'Struct', 'Event', 'Operator', 'TypeParameter'}

M.symbols = {}
local len = 25

for i = 1, len do
	local name = kind_order[i]
	M.symbols[i] = M.kind_symbols[name]
end

local script_dir = vim.env.XDG_CONFIG_HOME .. '/nvim/lua/'

function M.source(srcript)
	vim.cmd('source ' .. script_dir .. srcript .. '.vim')
end

function M.hi(token, fg)
	vim.cmd('hi ' .. token .. ' guifg=' .. fg)
end

---
--- Map to normal mode
---
function M.nmap(lh, rh)
	vim.api.nvim_set_keymap('n', lh, rh, opts)
end

---
--- Nmap with leader key
---
function M.lmap(lh, rh)
	vim.api.nvim_set_keymap('n', '<leader>' .. lh, rh, opts)
end

function M.imap(lh, rh)
	vim.api.nvim_set_keymap('i', lh, rh, opts)
end

---
--- map to both normal mode and insert mode
---
function M.map(lh, rh)
	M.nmap(lh, rh)
	M.imap(lh, '<ESC>' .. rh .. 'i')
end

function M.bmap(bufnr, mod, lh, rh)
	vim.api.nvim_buf_set_keymap(bufnr, mod, lh, rh, opts)
end

M.signdef = vim.fn.sign_define

-- json schema: {"dap":{"program": "string"}}

function M.readcfg(path)
	local f = io.open(path, "rb")
	local content = {}
	if f then
		pcall( function ()
			content = vim.fn.json_decode(f:read("*all"))
		end)
		f:close()
	end
	return content
end

function M.writecfg(path, content)
	local f = io.open(path, "rb")
	f = io.open(path, 'wb')
	f:write(vim.fn.json_encode(content))
	f:close()
end

return M
