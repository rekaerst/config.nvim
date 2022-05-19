local c = require("color.highlight").colors
local opts = {
	preview_bg_highlight = "Normal",
	symbols = {
		Array = { icon = "", hl = "TSConstant" },
		Boolean = { icon = "⊨", hl = "TSBoolean" },
		Class = { icon = "פּ", hl = "TSType" },
		Constant = { icon = "", hl = "TSConstant" },
		Constructor = { icon = "", hl = "TSConstructor" },
		Enum = { icon = "", hl = "TSType" },
		EnumMember = { icon = "", hl = "TSField" },
		Event = { icon = "鬒", hl = "TSType" },
		Field = { icon = "", hl = "TSField" },
		File = { icon = "", hl = "TSURI" },
		Function = { icon = "", hl = "TSFunction" },
		Interface = { icon = "", hl = "TSType" },
		Key = { icon = "🔐", hl = "TSType" },
		Method = { icon = "", hl = "TSMethod" },
		Module = { icon = "", hl = "TSNamespace" },
		Namespace = { icon = "", hl = "TSNamespace" },
		Null = { icon = "NULL", hl = "TSType" },
		Number = { icon = "", hl = "TSNumber" },
		Object = { icon = "⦿", hl = "TSType" },
		Operator = { icon = "", hl = "TSOperator" },
		Package = { icon = "", hl = "TSNamespace" },
		Property = { icon = "", hl = "TSMethod" },
		String = { icon = "", hl = "TSString" },
		Struct = { icon = "", hl = "TSType" },
		TypeParameter = { icon = "", hl = "TSParameter" },
		Variable = { icon = "", hl = "TSConstant" },
	},
}
vim.highlight.create("FocusedSymbol", { guibg = c.one_bg3 }, false)
require("symbols-outline").setup(opts)
