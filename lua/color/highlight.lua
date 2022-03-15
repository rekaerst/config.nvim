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
	yellow = "#e7c787",
	sun = "#EBCB8B",
	purple = "#b4bbc8",
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
local colors = M.colors

function M.setup()
	local black2 = colors.black
	local black3 = colors.black2
	local blue = colors.blue
	local black = colors.black4
	local black0 = colors.black3
	local folder_bg = colors.folder_bg
	local green = colors.green
	local grey = colors.grey
	local grey_fg = colors.grey_fg
	local light_grey = colors.light_grey
	local line = colors.line
	local nord_blue = colors.nord_blue
	local one_bg = colors.one_bg
	local one_bg2 = colors.one_bg2
	local pmenu_bg = colors.pmenu_bg
	local purple = colors.purple
	local red = colors.red
	local white = colors.white
	local yellow = colors.yellow
	local orange = colors.orange
	local one_bg3 = colors.one_bg3

	-- functions for setting highlights
	local fg = require("core.util").fg
	local fg_bg = require("core.util").fg_bg
	local bg = require("core.util").bg

	fg("Comment", grey_fg .. " gui=italic")

	-- Disable cursor line
	cmd("hi clear CursorLine")
	-- Line number
	fg("cursorlinenr", white)

	-- same it bg, so it doesn't appear
	fg("EndOfBuffer", black2)

	-- For floating windows
	fg("FloatBorder", blue)
	bg("NormalFloat", black)

	-- Pmenu
	bg("Pmenu", one_bg)
	bg("PmenuSbar", one_bg2)
	bg("PmenuSel", pmenu_bg)
	bg("PmenuThumb", nord_blue)
	fg("CmpItemAbbr", white)
	fg("CmpItemAbbrMatch", white)
	fg("CmpItemKind", white)
	fg("CmpItemMenu", white)

	-- misc

	-- inactive statuslines as thin lines
	fg("StatusLineNC", one_bg3 .. " gui=underline")

	fg("LineNr", grey)
	fg("NvimInternalError", red)
	fg("VertSplit", one_bg2)

	-- [[ Plugin Highlights

	-- Dashboard
	fg("AlphaHeader", grey_fg)
	fg("AlphaButtons", light_grey)

	-- Git signs
	fg_bg("DiffAdd", blue, "NONE")
	fg_bg("DiffChange", yellow, "NONE")
	fg_bg("DiffChangeDelete", red, "NONE")
	fg_bg("DiffModified", red, "NONE")
	fg_bg("DiffDelete", red, "NONE")

	-- Indent blankline plugin
	fg("IndentBlanklineChar", line)
	fg("IndentBlanklineSpaceChar", line)

	-- Lsp diagnostics

	fg("DiagnosticHint", purple)
	fg("DiagnosticError", red)
	fg("DiagnosticWarn", yellow)
	fg("DiagnosticInformation", blue)

	-- NvimTree
	fg("NvimTreeEmptyFolderName", folder_bg)
	fg("NvimTreeEndOfBuffer", black)
	fg("NvimTreeFolderIcon", folder_bg)
	fg("NvimTreeFolderName", folder_bg)
	fg("NvimTreeGitDirty", red)
	fg("NvimTreeIndentMarker", one_bg2)
	bg("NvimTreeNormal", black)
	bg("NvimTreeNormalNC", black)
	fg("NvimTreeOpenedFolderName", folder_bg)
	fg("NvimTreeRootFolder", red .. " gui=underline") -- enable underline for root folder in nvim tree
	fg_bg("NvimTreeStatuslineNc", black, black)
	fg_bg("NvimTreeVertSplit", black, black)
	fg_bg("NvimTreeWindowPicker", red, black3)

	-- Telescope
	fg_bg("TelescopeBorder", black0, black0)
	fg_bg("TelescopePromptBorder", black3, black3)

	fg_bg("TelescopePromptNormal", white, black3)
	fg_bg("TelescopePromptPrefix", red, black3)

	bg("TelescopeNormal", black0)

	fg_bg("TelescopePreviewTitle", black2, green)
	fg_bg("TelescopePromptTitle", black2, red)
	fg_bg("TelescopeResultsTitle", black0, black0)

	bg("TelescopeSelection", black3)

	-- Which-key
	bg("WhichKeyFloat", one_bg)
end

return M
