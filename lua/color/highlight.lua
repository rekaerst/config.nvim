local M = {}
local u = require("core.util")

M.colors = {
	bright = "#dfdfdf",
	white = "#abb2bf",
	light_black = "#252931",
	black = "#1e222a",
	black2 = "#1b1f27",
	black3 = "#13171d",
	one_bg = "#282c34", -- real bg of onedark
	one_bg2 = "#353b45",
	one_bg3 = "#30343c",
	light_grey = "#6f737b",
	grey = "#42464e",
	grey2 = "#565c64",
	red = "#d47d85",
	light_pink = "#de8C92",
	pink = "#ff75a0",
	line = "#2a2e36", -- for lines like vertsplit
	green = "#a3be8c",
	vibrant_green = "#7eca9c",
	nord_blue = "#81a1c1",
	blue = "#61afef",
	slate_blue = "#8078DD",
	yellow = "#e7c787",
	sun = "#ebcB8B",
	purple = "#faa2ff",
	dark_purple = "#c882e7",
	teal = "#519aba",
	orange = "#fca2aa",
	cyan = "#a3b8ef",
	statusline_bg = "#22262e",
	NONE = "NONE",
}
local c = M.colors

function M.setup()
	-- functions for setting highlights
	local hclear = u.hclear
	local highlight = u.highlight

	highlight("Comment", c.grey2, nil, "italic", nil)

	-- Disable cursor line
	hclear("CursorLine")
	highlight("CursorLineNr", c.white, nil, nil, nil)

	-- same it bg, so it doesn't appear
	highlight("EndOfBuffer", c.black, nil, nil, nil)

	-- For floating windows
	highlight("FloatBorder", c.blue, c.black, nil, nil)
	highlight("NormalFloat",nil, c.black2,nil,nil)

	-- Pmenu
	hclear("PmenuSel")
	highlight("Pmenu",nil, c.one_bg,nil,nil)
	highlight("PmenuSbar",nil, c.one_bg2,nil,nil)
	highlight("PmenuSel",nil, c.grey,nil,nil)
	highlight("PmenuThumb",nil, c.nord_blue,nil,nil)
	highlight("CmpItemAbbr", c.white, nil, nil, nil)
	highlight("CmpItemAbbrMatch", c.white, nil, nil, nil)
	highlight("CmpItemKind", c.white, nil, nil, nil)
	highlight("CmpItemMenu", c.white, nil, nil, nil)

	-- misc

	-- inactive statuslines as thin lines
	highlight("StatusLineNC", c.one_bg3, nil, "underline", nil)

	highlight("LineNr", c.grey, nil, nil, nil)
	highlight("NvimInternalError", c.red, nil, nil, nil)
	highlight("VertSplit", c.one_bg2, nil, nil, nil)

	-- Dashboard
	highlight("AlphaHeader", c.grey2, nil, nil, nil)
	highlight("AlphaButtons", c.light_grey, nil, nil, nil)

	-- Git signs
	highlight("DiffAdd", c.blue, c.NONE, nil, nil)
	highlight("DiffChange", c.yellow, c.NONE, nil, nil)
	highlight("DiffChangeDelete", c.red, c.NONE, nil, nil)
	highlight("DiffModified", c.red, c.NONE, nil, nil)
	highlight("DiffDelete", c.red, c.NONE, nil, nil)

	-- Lsp diagnostics
	highlight("DiagnosticError", c.red, nil, nil, nil)
	highlight("DiagnosticWarn", c.yellow, nil, nil, nil)
	highlight("DiagnosticInfo", c.blue, nil, nil, nil)
	highlight("DiagnosticHint", c.purple, nil, nil, nil)

	-- NvimTree
	highlight("NvimTreeEmptyFolderName", c.blue, nil, nil, nil)
	highlight("NvimTreeEndOfBuffer", c.black2, nil, nil, nil)
	highlight("NvimTreeFolderIcon", c.yellow, nil, nil, nil)
	highlight("NvimTreeFolderName", c.blue, nil, nil, nil)
	highlight("NvimTreeGitDirty", c.red, nil, nil, nil)
	highlight("NvimTreeIndentMarker", c.one_bg2, nil, nil, nil)
	highlight("NvimTreeNormal", nil, c.black2, nil, nil)
	highlight("NvimTreeNormalNC", nil, c.black2, nil, nil)
	highlight("NvimTreeOpenedFolderName", c.blue, nil, nil, nil)
	highlight("NvimTreeRootFolder", c.red, nil, "underline", nil) -- enable underline for root folder in nvim tree
	highlight("NvimTreeStatuslineNc", c.black2, c.black2, nil, nil)
	highlight("NvimTreeVertSplit", c.black2, c.black2, nil, nil)
	highlight("NvimTreeWindowPicker", c.red, c.light_black, nil, nil)

	-- WinShift
	highlight("WinShiftWindowPicker", c.red, c.light_black, nil, nil)

	-- Telescope
	highlight("TelescopeBorder", c.black3, c.black3, nil, nil)
	highlight("TelescopePromptBorder", c.light_black, c.light_black, nil, nil)
	highlight("TelescopePromptNormal", c.white, c.light_black, nil, nil)
	highlight("TelescopePromptPrefix", c.red, c.light_black, nil, nil)
	highlight("TelescopeNormal", nil, c.black3, nil, nil)
	highlight("TelescopePreviewTitle", c.black, c.green, nil, nil)
	highlight("TelescopePromptTitle", c.black, c.red, nil, nil)
	highlight("TelescopeResultsTitle", c.black3, c.black3, nil, nil)
	highlight("TelescopeSelection", nil, c.light_black, nil, nil)

	-- Which-key
	highlight("WhichKeyFloat", nil, c.one_bg, nil, nil)

	-- Syntax
	highlight("Operator", c.slate_blue, nil, nil, nil)
end

return M
