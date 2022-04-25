local M = {}

local cmd = vim.cmd

M.kind_symbols = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "פּ",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "ﭧ",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "鬒",
	Operator = "",
	TypeParameter = "",
}

M.signdef = vim.fn.sign_define

function M.hi(token, fg)
	vim.cmd("hi " .. token .. " guifg=" .. fg)
end

function M.cfg(name)
	return 'require "plugin.config.' .. name .. '"'
end

-- Highlight functions

--- Clear highlight group
--- @param group string Group
M.hclear = function(group)
	cmd("highlight! clear " .. group)
end

--- Link two highlight group
--- @param src  string group to link from
--- @param desc string group to link to
M.hlink = function(src, desc)
	cmd("highlight! link " .. src .. " " .. desc)
end

--- Define color
--- @param group string Group
--- @param guifg string Foreground Color
--- @param guibg string Background Color
--- @param attr  string Gui Attributes
--- @param guisp string Special Color
function M.highlight(group, guifg, guibg, attr, guisp)
	local parts = { group }
	if guifg then
		table.insert(parts, "guifg=" .. guifg)
	end
	if guibg then
		table.insert(parts, "guibg=" .. guibg)
	end
	if attr then
		table.insert(parts, "gui=" .. attr)
	end
	if guisp then
		table.insert(parts, "guisp=" .. guisp)
	end

	-- nvim.ex.highlight(parts)
	vim.api.nvim_command("highlight! " .. table.concat(parts, " "))
end

--- Define multiple colors
--- @param rules table {group, guifg, guibg, attr, guisp}
function M.hmany(rules)
	for _, v in ipairs(rules) do
		M.highlight(v[1], v[2], v[3], v[4], v[5])
	end
end

-- Check if table contains specific value
function M.has_value(table, value)
	for _, v in ipairs(table) do
		if v == value then
			return true
		end
	end
	return false
end

function M.read_json(path)
	local f = io.open(path, "rb")
	local content = {}
	if f then
		pcall(function()
			content = vim.fn.json_decode(f:read("*all"))
		end)
		f:close()
	end
	return content
end

function M.write_json(path, content)
	local f = io.open(path, "rb")
	f = io.open(path, "wb")
	f:write(vim.fn.json_encode(content))
	f:close()
end

return M
