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

-- Define bg color
-- @param group Group
-- @param color Color
M.bg = function(group, col)
	cmd("hi " .. group .. " guibg=" .. col)
end

-- Define fg color
-- @param group Group
-- @param color Color
M.fg = function(group, col)
	cmd("hi " .. group .. " guifg=" .. col)
end

-- Define bg and fg color
-- @param group Group
-- @param fgcol Fg Color
-- @param bgcol Bg Color
M.fg_bg = function(group, fgcol, bgcol)
	cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

--- Clear highlight group
--- @param group string Group
M.hclear = function(group)
	cmd("hi clear " .. group)
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
	vim.api.nvim_command("highlight " .. table.concat(parts, " "))
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
