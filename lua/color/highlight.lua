local M = {}
local cmd = vim.cmd
local u = require("core.util")

M.colors = {
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
	light_pink = "#DE8C92",
	pink = "#ff75a0",
	line = "#2a2e36", -- for lines like vertsplit
	green = "#A3BE8C",
	vibrant_green = "#7eca9c",
	nord_blue = "#81A1C1",
	blue = "#61afef",
	slate_blue = "#8078DD",
	yellow = "#e7c787",
	sun = "#EBCB8B",
	purple = "#faa2ff",
	dark_purple = "#c882e7",
	teal = "#519ABA",
	orange = "#fca2aa",
	cyan = "#a3b8ef",
	statusline_bg = "#22262e",
	pmenu_sel = "#A3BE8C",
}
local c = M.colors

function M.setup()
	-- functions for setting highlights
	local fg = u.fg
	local fg_bg = u.fg_bg
	local bg = u.bg

	fg("Comment", c.grey2 .. " gui=italic")

	-- Disable cursor line
	cmd("hi clear CursorLine")
	-- Line number
	fg("cursorlinenr", c.white)

	-- same it bg, so it doesn't appear
	fg("EndOfBuffer", c.black)

	-- For floating windows
	fg_bg("FloatBorder", c.blue, c.black)
	bg("NormalFloat", c.black2)

	-- Pmenu
	bg("Pmenu", c.one_bg)
	bg("PmenuSbar", c.one_bg2)
	bg("PmenuSel", c.pmenu_sel)
	bg("PmenuThumb", c.nord_blue)
	fg("CmpItemAbbr", c.white)
	fg("CmpItemAbbrMatch", c.white)
	fg("CmpItemKind", c.white)
	fg("CmpItemMenu", c.white)

	-- misc

	-- inactive statuslines as thin lines
	fg("StatusLineNC", c.one_bg3 .. " gui=underline")

	fg("LineNr", c.grey)
	fg("NvimInternalError", c.red)
	fg("VertSplit", c.one_bg2)

	-- Dashboard
	fg("AlphaHeader", c.grey2)
	fg("AlphaButtons", c.light_grey)

	-- Git signs
	fg_bg("DiffAdd", c.blue, "NONE")
	fg_bg("DiffChange", c.yellow, "NONE")
	fg_bg("DiffChangeDelete", c.red, "NONE")
	fg_bg("DiffModified", c.red, "NONE")
	fg_bg("DiffDelete", c.red, "NONE")

	-- Lsp diagnostics
	fg("DiagnosticError", c.red)
	fg("DiagnosticWarn", c.yellow)
	fg("DiagnosticInfo", c.blue)
	fg("DiagnosticHint", c.purple)

	-- NvimTree
	fg("NvimTreeEmptyFolderName", c.blue)
	fg("NvimTreeEndOfBuffer", c.black2)
	fg("NvimTreeFolderIcon", c.yellow)
	fg("NvimTreeFolderName", c.blue)
	fg("NvimTreeGitDirty", c.red)
	fg("NvimTreeIndentMarker", c.one_bg2)
	bg("NvimTreeNormal", c.black2)
	bg("NvimTreeNormalNC", c.black2)
	fg("NvimTreeOpenedFolderName", c.blue)
	fg("NvimTreeRootFolder", c.red .. " gui=underline") -- enable underline for root folder in nvim tree
	fg_bg("NvimTreeStatuslineNc", c.black2, c.black2)
	fg_bg("NvimTreeVertSplit", c.black2, c.black2)
	fg_bg("NvimTreeWindowPicker", c.red, c.light_black)

	-- WinShift
	fg_bg("WinShiftWindowPicker", c.red, c.light_black)

	-- Telescope
	fg_bg("TelescopeBorder", c.black3, c.black3)
	fg_bg("TelescopePromptBorder", c.light_black, c.light_black)
	fg_bg("TelescopePromptNormal", c.white, c.light_black)
	fg_bg("TelescopePromptPrefix", c.red, c.light_black)
	bg("TelescopeNormal", c.black3)
	fg_bg("TelescopePreviewTitle", c.black, c.green)
	fg_bg("TelescopePromptTitle", c.black, c.red)
	fg_bg("TelescopeResultsTitle", c.black3, c.black3)
	bg("TelescopeSelection", c.light_black)

	-- Which-key
	bg("WhichKeyFloat", c.one_bg)

	-- Syntax
	fg("Operator", c.slate_blue)
end

return M
