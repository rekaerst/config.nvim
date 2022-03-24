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
}

local function highlight(group, guifg, guibg, attr, guisp)
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

-- Modified from https://github.com/chriskempson/base16-vim
local function apply_base16_theme(theme)
	-- Neovim terminal colours
	if vim.fn.has("nvim") then
		vim.g.terminal_color_0 = theme.base00
		vim.g.terminal_color_1 = theme.base08
		vim.g.terminal_color_2 = theme.base0B
		vim.g.terminal_color_3 = theme.base0A
		vim.g.terminal_color_4 = theme.base0D
		vim.g.terminal_color_5 = theme.base0E
		vim.g.terminal_color_6 = theme.base0C
		vim.g.terminal_color_7 = theme.base05
		vim.g.terminal_color_8 = theme.base03
		vim.g.terminal_color_9 = theme.base08
		vim.g.terminal_color_10 = theme.base0B
		vim.g.terminal_color_11 = theme.base0A
		vim.g.terminal_color_12 = theme.base0D
		vim.g.terminal_color_13 = theme.base0E
		vim.g.terminal_color_14 = theme.base0C
		vim.g.terminal_color_15 = theme.base07
		if vim.o.background == "light" then
			vim.g.terminal_color_background = theme.base05
			vim.g.terminal_color_foreground = theme.base0B
		else
			vim.g.terminal_color_background = theme.base00
			vim.g.terminal_color_foreground = theme.base0E
		end
	end

	-- TODO
	-- nvim.command "hi clear"
	-- nvim.command "syntax reset"

	-- Vim editor colors
	highlight("Normal", theme.base05, theme.base00, nil, nil)
	highlight("Bold", nil, nil, "bold", nil)
	highlight("Debug", theme.base08, nil, nil, nil)
	highlight("Directory", theme.base0D, nil, nil, nil)
	highlight("Error", theme.base00, theme.base08, nil, nil)
	highlight("ErrorMsg", theme.base08, theme.base00, nil, nil)
	highlight("Exception", theme.base08, nil, nil, nil)
	highlight("FoldColumn", theme.base0C, theme.base01, nil, nil)
	highlight("Folded", theme.base03, theme.base01, nil, nil)
	highlight("IncSearch", theme.base01, theme.base09, "none", nil)
	highlight("Italic", nil, nil, "none", nil)
	highlight("Macro", theme.base08, nil, nil, nil)
	highlight("MatchParen", nil, theme.base03, nil, nil)
	highlight("ModeMsg", theme.base0B, nil, nil, nil)
	highlight("MoreMsg", theme.base0B, nil, nil, nil)
	highlight("Question", theme.base0D, nil, nil, nil)
	highlight("Search", theme.base01, theme.base0A, nil, nil)
	highlight("Substitute", theme.base01, theme.base0A, "none", nil)
	highlight("SpecialKey", theme.base03, nil, nil, nil)
	highlight("TooLong", theme.base08, nil, nil, nil)
	highlight("Underlined", theme.base08, nil, nil, nil)
	highlight("Visual", nil, theme.base02, nil, nil)
	highlight("VisualNOS", theme.base08, nil, nil, nil)
	highlight("WarningMsg", theme.base08, nil, nil, nil)
	highlight("WildMenu", theme.base08, theme.base0A, nil, nil)
	highlight("Title", theme.base0D, nil, "none", nil)
	highlight("Conceal", theme.base0D, theme.base00, nil, nil)
	highlight("Cursor", theme.base00, theme.base05, nil, nil)
	highlight("NonText", theme.base03, nil, nil, nil)
	highlight("LineNr", theme.base03, "NONE", nil, nil)
	highlight("SignColumn", theme.base03, "NONE", nil, nil)
	highlight("StatusLine", theme.base04, "NONE", "none", nil)
	highlight("StatusLineNC", theme.base03, "NONE", "none", nil)
	highlight("VertSplit", theme.base02, "NONE", "none", nil)
	highlight("ColorColumn", nil, theme.base01, "none", nil)
	highlight("CursorColumn", nil, theme.base01, "none", nil)
	highlight("CursorLine", nil, theme.base01, "none", nil)
	highlight("CursorLineNr", theme.base04, "NONE", nil, nil)
	highlight("QuickFixLine", nil, theme.base01, "none", nil)
	highlight("PMenu", theme.base05, theme.base01, "none", nil)
	highlight("PMenuSel", theme.base01, theme.base05, nil, nil)
	highlight("TabLine", theme.base03, theme.base01, "none", nil)
	highlight("TabLineFill", theme.base03, theme.base01, "none", nil)
	highlight("TabLineSel", theme.base0B, theme.base01, "none", nil)
	
	-- Diagnostic
	highlight("DiagnosticError", theme.base08, nil, nil, nil)
	highlight("DiagnosticWarn", theme.base0A, nil, nil, nil)
	highlight("DiagnosticInfo", theme.base0D, nil, nil, nil)
	highlight("DiagnosticHint", theme.base0E, nil, nil, nil)
	highlight("DiagnosticUnderlineError", nil, nil, 'underline', theme.base08)
	highlight("DiagnosticUnderlineWarn", nil, nil, 'underline', theme.base0A)
	highlight("DiagnosticUnderlineInfo", nil, nil, 'underline', theme.base0D)
	highlight("DiagnosticUnderlineHint", nil, nil, 'underline', theme.base0E)

	-- Standard syntax highlighting
	highlight("Boolean", theme.base09, nil, nil, nil)
	highlight("Character", theme.base08, nil, nil, nil)
	highlight("Comment", theme.base03, nil, nil, nil)
	highlight("Conditional", theme.base0E, nil, nil, nil)
	highlight("Constant", theme.base09, nil, nil, nil)
	highlight("Define", theme.base0E, nil, "none", nil)
	highlight("Delimiter", theme.base0F, nil, nil, nil)
	highlight("Float", theme.base09, nil, nil, nil)
	highlight("Function", theme.base0D, nil, nil, nil)
	highlight("Identifier", theme.base08, nil, "none", nil)
	highlight("Include", theme.base0D, nil, nil, nil)
	highlight("Keyword", theme.base0E, nil, nil, nil)
	highlight("Label", theme.base0A, nil, nil, nil)
	highlight("Number", theme.base09, nil, nil, nil)
	highlight("Operator", theme.base0E, nil, "none", nil)
	highlight("PreProc", theme.base0A, nil, nil, nil)
	highlight("Repeat", theme.base0E, nil, nil, nil)
	highlight("Special", theme.base0C, nil, nil, nil)
	highlight("SpecialChar", theme.base0F, nil, nil, nil)
	highlight("Statement", theme.base08, nil, nil, nil)
	highlight("StorageClass", theme.base0A, nil, nil, nil)
	highlight("String", theme.base0B, nil, nil, nil)
	highlight("Structure", theme.base0E, nil, nil, nil)
	highlight("Tag", theme.base0A, nil, nil, nil)
	highlight("Todo", theme.base0A, theme.base01, nil, nil)
	highlight("Type", theme.base0A, nil, "none", nil)
	highlight("Typedef", theme.base0A, nil, nil, nil)

	-- Diff highlighting
	highlight("DiffAdd", theme.base0B, theme.base01, nil, nil)
	highlight("DiffChange", theme.base03, theme.base01, nil, nil)
	highlight("DiffDelete", theme.base08, theme.base01, nil, nil)
	highlight("DiffText", theme.base0D, theme.base01, nil, nil)
	highlight("DiffAdded", theme.base0B, theme.base00, nil, nil)
	highlight("DiffFile", theme.base08, theme.base00, nil, nil)
	highlight("DiffNewFile", theme.base0B, theme.base00, nil, nil)
	highlight("DiffLine", theme.base0D, theme.base00, nil, nil)
	highlight("DiffRemoved", theme.base08, theme.base00, nil, nil)

	-- Git highlighting
	highlight("gitcommitOverflow", theme.base08, nil, nil, nil)
	highlight("gitcommitSummary", theme.base0B, nil, nil, nil)
	highlight("gitcommitComment", theme.base03, nil, nil, nil)
	highlight("gitcommitUntracked", theme.base03, nil, nil, nil)
	highlight("gitcommitDiscarded", theme.base03, nil, nil, nil)
	highlight("gitcommitSelected", theme.base03, nil, nil, nil)
	highlight("gitcommitHeader", theme.base0E, nil, nil, nil)
	highlight("gitcommitSelectedType", theme.base0D, nil, nil, nil)
	highlight("gitcommitUnmergedType", theme.base0D, nil, nil, nil)
	highlight("gitcommitDiscardedType", theme.base0D, nil, nil, nil)
	highlight("gitcommitBranch", theme.base09, nil, "bold", nil)
	highlight("gitcommitUntrackedFile", theme.base0A, nil, nil, nil)
	highlight("gitcommitUnmergedFile", theme.base08, nil, "bold", nil)
	highlight("gitcommitDiscardedFile", theme.base08, nil, "bold", nil)
	highlight("gitcommitSelectedFile", theme.base0B, nil, "bold", nil)

	-- Mail highlighting
	highlight("mailQuoted1", theme.base0A, nil, nil, nil)
	highlight("mailQuoted2", theme.base0B, nil, nil, nil)
	highlight("mailQuoted3", theme.base0E, nil, nil, nil)
	highlight("mailQuoted4", theme.base0C, nil, nil, nil)
	highlight("mailQuoted5", theme.base0D, nil, nil, nil)
	highlight("mailQuoted6", theme.base0A, nil, nil, nil)
	highlight("mailURL", theme.base0D, nil, nil, nil)
	highlight("mailEmail", theme.base0D, nil, nil, nil)

	-- Spelling highlighting
	highlight("SpellBad", nil, nil, "undercurl", theme.base08)
	highlight("SpellLocal", nil, nil, "undercurl", theme.base0C)
	highlight("SpellCap", nil, nil, "undercurl", theme.base0D)
	highlight("SpellRare", nil, nil, "undercurl", theme.base0E)

	-- treesitter
	highlight("TSAnnotation", theme.base0F, nil, "none", nil)
	highlight("TSAttribute", theme.base0A, nil, "none", nil)
	highlight("TSCharacter", theme.base08, nil, "none", nil)
	highlight("TSConstBuiltin", theme.base09, nil, "none", nil)
	highlight("TSConstMacro", theme.base08, nil, "none", nil)
	highlight("TSError", theme.base08, nil, "none", nil)
	highlight("TSException", theme.base08, nil, "none", nil)
	highlight("TSFloat", theme.base09, nil, "none", nil)
	highlight("TSFuncBuiltin", theme.base0D, nil, "none", nil)
	highlight("TSFuncMacro", theme.base08, nil, "none", nil)
	highlight("TSKeywordFunction", theme.base0E, nil, "none", nil)
	highlight("TSKeywordOperator", theme.base0E, nil, "none", nil)
	highlight("TSMethod", theme.base0D, nil, "none", nil)
	highlight("TSNamespace", theme.base08, nil, "none", nil)
	highlight("TSNone", theme.base05, nil, "none", nil)
	highlight("TSParameter", theme.base08, nil, "none", nil)
	highlight("TSParameterReference", theme.base05, nil, "none", nil)
	highlight("TSPunctDelimiter", theme.base0F, nil, "none", nil)
	highlight("TSPunctSpecial", theme.base05, nil, "none", nil)
	highlight("TSStringRegex", theme.base0C, nil, "none", nil)
	highlight("TSStringEscape", theme.base0C, nil, "none", nil)
	highlight("TSSymbol", theme.base0B, nil, "none", nil)
	highlight("TSTagDelimiter", theme.base0F, nil, "none", nil)
	highlight("TSText", theme.base05, nil, "none", nil)
	highlight("TSStrong", nil, nil, "bold", nil)
	highlight("TSEmphasis", theme.base09, nil, "none", nil)
	highlight("TSStrike", theme.base00, nil, "strikethrough", nil)
	highlight("TSLiteral", theme.base09, nil, "none", nil)
	highlight("TSURI", theme.base09, nil, "underline", nil)
	highlight("TSTypeBuiltin", theme.base0A, nil, "none", nil)
	highlight("TSVariableBuiltin", theme.base09, nil, "none", nil)
	highlight("TSDefinition", nil, nil, "underline", theme.base04)
	highlight("TSDefinitionUsage", nil, nil, "underline", theme.base04)
	highlight("TSCurrentScope", nil, nil, "bold", nil)

	-- TODO
	-- nvim.command 'syntax on'
end

function M.setup()
	apply_base16_theme(M.colors)
end

return M
