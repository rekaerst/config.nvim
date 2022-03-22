local M = {}

local cmd = vim.cmd

M.kind_symbols = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
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
local kind_order = {
	"Text",
	"Method",
	"Function",
	"Constructor",
	"Field",
	"Variable",
	"Class",
	"Interface",
	"Module",
	"Property",
	"Unit",
	"Value",
	"Enum",
	"Keyword",
	"Snippet",
	"Color",
	"File",
	"Reference",
	"Folder",
	"EnumMember",
	"Constant",
	"Struct",
	"Event",
	"Operator",
	"TypeParameter",
}
M.symbols = {}
local len = 25
for i = 1, len do
	local name = kind_order[i]
	M.symbols[i] = M.kind_symbols[name]
end

M.signdef = vim.fn.sign_define

function M.hi(token, fg)
	vim.cmd("hi " .. token .. " guifg=" .. fg)
end

function M.cfg(name)
	return 'require "plugin.config.' .. name .. '"'
end

-- check if file exists
-- @param path Path of file
function M.file_exists(path)
	local f = io.open(path, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
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

function M.readcfg(path)
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

function M.writecfg(path, content)
	local f = io.open(path, "rb")
	f = io.open(path, "wb")
	f:write(vim.fn.json_encode(content))
	f:close()
end

return M
