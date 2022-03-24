local M = {}
local cmd = vim.cmd

M.colors = {
	white = "#abb2bf",
	black = "#1e222a", --  nvim bg
	black2 = "#252931",
	black3 = "#13171d",
	black4 = "#1b1f27",
	one_bg = "#282c34", -- real bg of onedark
	one_bg2 = "#353b45",
	one_bg3 = "#30343c",
	grey = "#42464e",
	grey_fg = "#565c64",
	grey_fg2 = "#6f737b",
	light_grey = "#6f737b",
	red = "#d47d85",
	baby_pink = "#DE8C92",
	pink = "#ff75a0",
	line = "#2a2e36", -- for lines like vertsplit
	green = "#A3BE8C",
	vibrant_green = "#7eca9c",
	nord_blue = "#81A1C1",
	blue = "#61afef",
	slate_blue = "#7680EF",
	yellow = "#e7c787",
	sun = "#EBCB8B",
	purple = "#faa2ff",
	dark_purple = "#c882e7",
	teal = "#519ABA",
	orange = "#fca2aa",
	cyan = "#a3b8ef",
	statusline_bg = "#22262e",
	lightbg = "#2d3139",
	lightbg2 = "#262a32",
	pmenu_bg = "#A3BE8C",
	folder_bg = "#61afef",
}
local c = M.colors

function M.setup()
	-- functions for setting highlights
	local fg = require("core.util").fg
	local fg_bg = require("core.util").fg_bg
	local bg = require("core.util").bg

	fg("Comment", c.grey_fg .. " gui=italic")

	-- Disable cursor line
	cmd("hi clear CursorLine")
	-- Line number
	fg("cursorlinenr", c.white)

	-- same it bg, so it doesn't appear
	fg("EndOfBuffer", c.black)

	-- For floating windows
	fg("FloatBorder", c.blue)
	bg("NormalFloat", c.black4)

	-- Pmenu
	bg("Pmenu", c.one_bg)
	bg("PmenuSbar", c.one_bg2)
	bg("PmenuSel", c.pmenu_bg)
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
	fg("AlphaHeader", c.grey_fg)
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
	fg("NvimTreeEmptyFolderName", c.folder_bg)
	fg("NvimTreeEndOfBuffer", c.black4)
	fg("NvimTreeFolderIcon", c.folder_bg)
	fg("NvimTreeFolderName", c.folder_bg)
	fg("NvimTreeGitDirty", c.red)
	fg("NvimTreeIndentMarker", c.one_bg2)
	bg("NvimTreeNormal", c.black4)
	bg("NvimTreeNormalNC", c.black4)
	fg("NvimTreeOpenedFolderName", c.folder_bg)
	fg("NvimTreeRootFolder", c.red .. " gui=underline") -- enable underline for root folder in nvim tree
	fg_bg("NvimTreeStatuslineNc", c.black4, c.black4)
	fg_bg("NvimTreeVertSplit", c.black4, c.black4)
	fg_bg("NvimTreeWindowPicker", c.red, c.black2)

	-- Telescope
	fg_bg("TelescopeBorder", c.black3, c.black3)
	fg_bg("TelescopePromptBorder", c.black2, c.black2)

	fg_bg("TelescopePromptNormal", c.white, c.black2)
	fg_bg("TelescopePromptPrefix", c.red, c.black2)

	bg("TelescopeNormal", c.black3)

	fg_bg("TelescopePreviewTitle", c.black, c.green)
	fg_bg("TelescopePromptTitle", c.black, c.red)
	fg_bg("TelescopeResultsTitle", c.black3, c.black3)

	bg("TelescopeSelection", c.black2)

	-- Which-key
	bg("WhichKeyFloat", c.one_bg)

	-- Syntax
	fg("Operator", c.slate_blue)
end

return M
