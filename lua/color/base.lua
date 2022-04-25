local hmany = require("core.util").hmany
local M = {}

M.colors = {
	base00 = "#1e222a",
	base01 = "#353b45",
	base02 = "#3e4451",
	base03 = "#545862",
	base04 = "#565c64",
	base05 = "#abb2bf",
	base06 = "#b6bdca",
	base07 = "#c8ccd4",
	base08 = "#e06c75",
	base09 = "#d19a66",
	base0A = "#e5c07b",
	base0B = "#98c379",
	base0C = "#56b6c2",
	base0D = "#61afef",
	base0E = "#c678dd",
	base0F = "#be5046",
	none = "none",
}

-- Modified from https://github.com/chriskempson/base16-vim
local function apply_theme(c)
	-- Neovim terminal colours
	if vim.fn.has("nvim") then
		vim.g.terminal_color_0 = c.base00
		vim.g.terminal_color_1 = c.base08
		vim.g.terminal_color_2 = c.base0B
		vim.g.terminal_color_3 = c.base0A
		vim.g.terminal_color_4 = c.base0D
		vim.g.terminal_color_5 = c.base0E
		vim.g.terminal_color_6 = c.base0C
		vim.g.terminal_color_7 = c.base05
		vim.g.terminal_color_8 = c.base03
		vim.g.terminal_color_9 = c.base08
		vim.g.terminal_color_10 = c.base0B
		vim.g.terminal_color_11 = c.base0A
		vim.g.terminal_color_12 = c.base0D
		vim.g.terminal_color_13 = c.base0E
		vim.g.terminal_color_14 = c.base0C
		vim.g.terminal_color_15 = c.base07
		if vim.o.background == "light" then
			vim.g.terminal_color_background = c.base05
			vim.g.terminal_color_foreground = c.base0B
		else
			vim.g.terminal_color_background = c.base00
			vim.g.terminal_color_foreground = c.base0E
		end
	end

	hmany({
		-- Vim editor colors
		{ "Normal", c.base05, c.base00, nil, nil },
		{ "Bold", nil, nil, "bold", nil },
		{ "Debug", c.base08, nil, nil, nil },
		{ "Directory", c.base0D, nil, nil, nil },
		{ "Error", c.base00, c.base08, nil, nil },
		{ "ErrorMsg", c.base08, c.base00, nil, nil },
		{ "Exception", c.base08, nil, nil, nil },
		{ "FoldColumn", c.base0C, c.base01, nil, nil },
		{ "Folded", c.base03, c.base01, nil, nil },
		{ "IncSearch", c.base01, c.base09, c.none, nil },
		{ "Italic", nil, nil, c.none, nil },
		{ "Macro", c.base08, nil, nil, nil },
		{ "MatchParen", nil, c.base03, nil, nil },
		{ "ModeMsg", c.base0B, nil, nil, nil },
		{ "MoreMsg", c.base0B, nil, nil, nil },
		{ "Question", c.base0D, nil, nil, nil },
		{ "Search", c.base01, c.base0A, nil, nil },
		{ "Substitute", c.base01, c.base0A, c.none, nil },
		{ "SpecialKey", c.base03, nil, nil, nil },
		{ "TooLong", c.base08, nil, nil, nil },
		{ "Underlined", c.base08, nil, nil, nil },
		{ "Visual", nil, c.base02, nil, nil },
		{ "VisualNOS", c.base08, nil, nil, nil },
		{ "WarningMsg", c.base08, nil, nil, nil },
		{ "WildMenu", c.base08, c.base0A, nil, nil },
		{ "Title", c.base0D, nil, c.none, nil },
		{ "Conceal", c.base0D, c.base00, nil, nil },
		{ "Cursor", c.base00, c.base05, nil, nil },
		{ "NonText", c.base03, nil, nil, nil },
		{ "LineNr", c.base03, c.none, nil, nil },
		{ "SignColumn", c.base03, c.none, nil, nil },
		{ "StatusLine", c.base04, c.none, c.none, nil },
		{ "StatusLineNC", c.base03, c.none, c.none, nil },
		{ "VertSplit", c.base02, c.none, c.none, nil },
		{ "ColorColumn", nil, c.base01, c.none, nil },
		{ "CursorColumn", nil, c.base01, c.none, nil },
		{ "CursorLine", nil, c.base01, c.none, nil },
		{ "CursorLineNr", c.base04, c.none, nil, nil },
		{ "QuickFixLine", nil, c.base01, c.none, nil },
		{ "PMenu", c.base05, c.base01, c.none, nil },
		{ "PMenuSel", c.base01, c.base05, nil, nil },
		{ "TabLine", c.base03, c.base01, c.none, nil },
		{ "TabLineFill", c.base03, c.base01, c.none, nil },
		{ "TabLineSel", c.base0B, c.base01, c.none, nil },

		-- Diagnostic
		{ "DiagnosticError", c.base08, nil, nil, nil },
		{ "DiagnosticWarn", c.base0A, nil, nil, nil },
		{ "DiagnosticInfo", c.base0D, nil, nil, nil },
		{ "DiagnosticHint", c.base0E, nil, nil, nil },
		{ "DiagnosticUnderlineError", nil, nil, "underline", c.base08 },
		{ "DiagnosticUnderlineWarn", nil, nil, "underline", c.base0A },
		{ "DiagnosticUnderlineInfo", nil, nil, "underline", c.base0D },
		{ "DiagnosticUnderlineHint", nil, nil, "underline", c.base0E },

		-- Standard syntax ,ing
		{ "Boolean", c.base09, nil, nil, nil },
		{ "Character", c.base08, nil, nil, nil },
		{ "Comment", c.base03, nil, nil, nil },
		{ "Conditional", c.base0E, nil, nil, nil },
		{ "Constant", c.base09, nil, nil, nil },
		{ "Define", c.base0E, nil, c.none, nil },
		{ "Delimiter", c.base0F, nil, nil, nil },
		{ "Float", c.base09, nil, nil, nil },
		{ "Function", c.base0D, nil, nil, nil },
		{ "Identifier", c.base08, nil, c.none, nil },
		{ "Include", c.base0E, nil, nil, nil },
		{ "Keyword", c.base0E, nil, nil, nil },
		{ "Label", c.base0A, nil, nil, nil },
		{ "Number", c.base09, nil, nil, nil },
		{ "Operator", c.base0E, nil, c.none, nil },
		{ "PreProc", c.base0A, nil, nil, nil },
		{ "Repeat", c.base0E, nil, nil, nil },
		{ "Special", c.base0C, nil, nil, nil },
		{ "SpecialChar", c.base0F, nil, nil, nil },
		{ "Statement", c.base0E, nil, nil, nil },
		{ "StorageClass", c.base0A, nil, nil, nil },
		{ "String", c.base0B, nil, nil, nil },
		{ "Structure", c.base0E, nil, nil, nil },
		{ "Tag", c.base0A, nil, nil, nil },
		{ "Todo", c.base0A, c.base01, nil, nil },
		{ "Type", c.base0A, nil, c.none, nil },
		{ "Typedef", c.base0A, nil, nil, nil },

		-- Diff ,ing
		{ "DiffAdd", c.base0B, c.base01, nil, nil },
		{ "DiffChange", c.base03, c.base01, nil, nil },
		{ "DiffDelete", c.base08, c.base01, nil, nil },
		{ "DiffText", c.base0D, c.base01, nil, nil },
		{ "DiffAdded", c.base0B, c.base00, nil, nil },
		{ "DiffFile", c.base08, c.base00, nil, nil },
		{ "DiffNewFile", c.base0B, c.base00, nil, nil },
		{ "DiffLine", c.base0D, c.base00, nil, nil },
		{ "DiffRemoved", c.base08, c.base00, nil, nil },

		-- Git ,ing
		{ "gitcommitOverflow", c.base08, nil, nil, nil },
		{ "gitcommitSummary", c.base0B, nil, nil, nil },
		{ "gitcommitComment", c.base03, nil, nil, nil },
		{ "gitcommitUntracked", c.base03, nil, nil, nil },
		{ "gitcommitDiscarded", c.base03, nil, nil, nil },
		{ "gitcommitSelected", c.base03, nil, nil, nil },
		{ "gitcommitHeader", c.base0E, nil, nil, nil },
		{ "gitcommitSelectedType", c.base0D, nil, nil, nil },
		{ "gitcommitUnmergedType", c.base0D, nil, nil, nil },
		{ "gitcommitDiscardedType", c.base0D, nil, nil, nil },
		{ "gitcommitBranch", c.base09, nil, "bold", nil },
		{ "gitcommitUntrackedFile", c.base0A, nil, nil, nil },
		{ "gitcommitUnmergedFile", c.base08, nil, "bold", nil },
		{ "gitcommitDiscardedFile", c.base08, nil, "bold", nil },
		{ "gitcommitSelectedFile", c.base0B, nil, "bold", nil },

		-- Mail ,ing
		{ "mailQuoted1", c.base0A, nil, nil, nil },
		{ "mailQuoted2", c.base0B, nil, nil, nil },
		{ "mailQuoted3", c.base0E, nil, nil, nil },
		{ "mailQuoted4", c.base0C, nil, nil, nil },
		{ "mailQuoted5", c.base0D, nil, nil, nil },
		{ "mailQuoted6", c.base0A, nil, nil, nil },
		{ "mailURL", c.base0D, nil, nil, nil },
		{ "mailEmail", c.base0D, nil, nil, nil },

		-- Spelling ,ing
		{ "SpellBad", nil, nil, "undercurl", c.base08 },
		{ "SpellLocal", nil, nil, "undercurl", c.base0C },
		{ "SpellCap", nil, nil, "undercurl", c.base0D },
		{ "SpellRare", nil, nil, "undercurl", c.base0E },

		-- treesitter
		{ "TSAnnotation", c.base0F, nil, c.none, nil },
		{ "TSAttribute", c.base0A, nil, c.none, nil },
		{ "TSCharacter", c.base08, nil, c.none, nil },
		{ "TSConstBuiltin", c.base09, nil, c.none, nil },
		{ "TSConstMacro", c.base08, nil, c.none, nil },
		{ "TSError", c.base08, nil, c.none, nil },
		{ "TSException", c.base08, nil, c.none, nil },
		{ "TSFloat", c.base09, nil, c.none, nil },
		{ "TSFuncBuiltin", c.base0D, nil, c.none, nil },
		{ "TSFuncMacro", c.base08, nil, c.none, nil },
		{ "TSKeywordFunction", c.base0E, nil, c.none, nil },
		{ "TSKeywordOperator", c.base0E, nil, c.none, nil },
		{ "TSMethod", c.base0D, nil, c.none, nil },
		{ "TSNamespace", c.base08, nil, c.none, nil },
		{ "TSNone", c.base05, nil, c.none, nil },
		{ "TSParameter", c.base08, nil, c.none, nil },
		{ "TSParameterReference", c.base05, nil, c.none, nil },
		{ "TSPunctDelimiter", c.base0F, nil, c.none, nil },
		{ "TSPunctSpecial", c.base05, nil, c.none, nil },
		{ "TSStringRegex", c.base0C, nil, c.none, nil },
		{ "TSStringEscape", c.base0C, nil, c.none, nil },
		{ "TSSymbol", c.base0B, nil, c.none, nil },
		{ "TSTagDelimiter", c.base0F, nil, c.none, nil },
		{ "TSText", c.base05, nil, c.none, nil },
		{ "TSStrong", nil, nil, "bold", nil },
		{ "TSEmphasis", c.base09, nil, c.none, nil },
		{ "TSStrike", c.base00, nil, "strikethrough", nil },
		{ "TSLiteral", c.base09, nil, c.none, nil },
		{ "TSLabel", c.base08, nil, c.none, nil },
		{ "TSURI", c.base09, nil, "underline", nil },
		{ "TSTypeBuiltin", c.base0A, nil, c.none, nil },
		{ "TSVariableBuiltin", c.base09, nil, c.none, nil },
		{ "TSDefinition", nil, nil, "underline", c.base04 },
		{ "TSDefinitionUsage", nil, nil, "underline", c.base04 },
		{ "TSCurrentScope", nil, nil, "bold", nil },
	})

	-- TODO
	-- nvim.command 'syntax on'
end

function M.setup()
	apply_theme(M.colors)
end

return M
