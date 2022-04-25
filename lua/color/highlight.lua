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
	dap_stopped = "#565a30",
	none = "none",
}
local c = M.colors

function M.setup()
	-- functions for setting highlights
	local hclear = u.hclear
	local hmany = u.hmany
	hclear("CursorLine")
	hclear("PmenuSel")
	hmany({
		-- editor
		{ "Comment", c.grey2, nil, "italic", nil },
		{ "ColorColumn", c.none, c.black2, nil, nil },
		{ "CursorLineNr", c.white, nil, nil, nil },
		{ "EndOfBuffer", c.black, nil, nil, nil },
		{ "FloatBorder", c.blue, c.black, nil, nil },
		{ "NormalFloat", nil, c.black2, nil, nil },
		{ "Pmenu", nil, c.one_bg, nil, nil },
		{ "PmenuSbar", nil, c.one_bg2, nil, nil },
		{ "PmenuSel", nil, c.grey, nil, nil },
		{ "PmenuThumb", nil, c.nord_blue, nil, nil },

		-- cmp
		{ "CmpItemKind", c.white, nil, nil, nil },
		{ "CmpItemMenu", c.white, nil, nil, nil },
		{ "CmpItemAbbrMatch", c.bright, nil, "bold", nil },
		{ "CmpItemAbbrMatchFuzzy", c.bright, nil, "bold", nil },
		{ "CmpItemAbbrDeprecated", c.light_grey, c.none, "strikethrough", nil },
		{ "CmpItemKindVariable", c.blue, nil, nil, nil },
		{ "CmpItemKindInterface", c.blue, nil, nil, nil },
		{ "CmpItemKindText", c.blue, nil, nil, nil },
		{ "CmpItemKindFunction", c.purple, nil, nil, nil },
		{ "CmpItemKindMethod", c.purple, nil, nil, nil },
		{ "CmpItemKindKeyword", c.bright, nil, nil, nil },
		{ "CmpItemKindProperty", c.bright, nil, nil, nil },
		{ "CmpItemKindUnit", c.bright, nil, nil, nil },

		-- misc

		-- inactive statuslines as thin lines
		{ "StatusLineNC", c.one_bg3, nil, "underline", nil },

		{ "LineNr", c.grey, nil, nil, nil },
		{ "NvimInternalError", c.red, nil, nil, nil },
		{ "VertSplit", c.one_bg2, nil, nil, nil },

		-- Dashboard
		{ "AlphaHeader", c.grey2, nil, nil, nil },
		{ "AlphaButtons", c.light_grey, nil, nil, nil },

		-- Git signs
		{ "DiffAdd", c.blue, c.none, nil, nil },
		{ "DiffChange", c.yellow, c.none, nil, nil },
		{ "DiffChangeDelete", c.red, c.none, nil, nil },
		{ "DiffModified", c.red, c.none, nil, nil },
		{ "DiffDelete", c.red, c.none, nil, nil },

		-- Lsp diagnostics
		{ "DiagnosticError", c.red, nil, nil, nil },
		{ "DiagnosticWarn", c.yellow, nil, nil, nil },
		{ "DiagnosticInfo", c.blue, nil, nil, nil },
		{ "DiagnosticHint", c.purple, nil, nil, nil },

		-- NvimTree
		{ "NvimTreeEmptyFolderName", c.blue, nil, nil, nil },
		{ "NvimTreeEndOfBuffer", c.black2, nil, nil, nil },
		{ "NvimTreeFolderIcon", c.yellow, nil, nil, nil },
		{ "NvimTreeFolderName", c.blue, nil, nil, nil },
		{ "NvimTreeGitDirty", c.red, nil, nil, nil },
		{ "NvimTreeIndentMarker", c.one_bg2, nil, nil, nil },
		{ "NvimTreeNormal", nil, c.black2, nil, nil },
		{ "NvimTreeNormalNC", nil, c.black2, nil, nil },
		{ "NvimTreeOpenedFolderName", c.blue, nil, nil, nil },
		{ "NvimTreeRootFolder", c.red, nil, "underline", nil },
		{ "NvimTreeStatuslineNc", c.black2, c.black2, nil, nil },
		{ "NvimTreeVertSplit", c.black2, c.black2, nil, nil },
		{ "NvimTreeWindowPicker", c.red, c.light_black, nil, nil },

		-- WinShift
		{ "WinShiftWindowPicker", c.red, c.light_black, nil, nil },

		-- Telescope
		{ "TelescopeBorder", c.black3, c.black3, nil, nil },
		{ "TelescopePromptBorder", c.light_black, c.light_black, nil, nil },
		{ "TelescopePromptNormal", c.white, c.light_black, nil, nil },
		{ "TelescopePromptPrefix", c.red, c.light_black, nil, nil },
		{ "TelescopeNormal", nil, c.black3, nil, nil },
		{ "TelescopePreviewTitle", c.black, c.green, nil, nil },
		{ "TelescopePromptTitle", c.black, c.red, nil, nil },
		{ "TelescopeResultsTitle", c.black3, c.black3, nil, nil },
		{ "TelescopeSelection", nil, c.light_black, nil, nil },

		-- Which-key
		{ "WhichKeyFloat", nil, c.one_bg, nil, nil },

		-- Syntax
		{ "Operator", c.slate_blue, nil, nil, nil },

		-- dap
		{ "DapStopped", c.none, c.dap_stopped, nil, nil },
	})
end

return M
