local g = vim.g
local opt = vim.opt
--
-- Mapping
--

local mapping = {
	-- Comment
	{ "a", "gc", "<Plug>VSCodeCommentary" },
	{ "o", "gc", "<Plug>VSCodeCommentary" },
	{ "n", "gcc", "<Plug>VSCodeCommentaryLine" },

	{ "a", "<leader>es", "<cmd> call VSCodeNotify('actions.find')<cr>" },
	{ "a", "<leader>ef", "<cmd> call VSCodeNotify('workbench.action.findInFiles')<cr>" }, -- show find panel

	{ "a", "<leader>fw", "<cmd> call VSCodeNotify('workbench.action.files.save')<cr>" },
	{ "a", "<leader>fa", "<cmd> call VSCodeNotify('workbench.action.files.saveAll')<cr>" },
	{ "a", "<leader>fr", "<cmd> call VSCodeNotify('workbench.action.openRecent')<cr>" },

	{ "a", "<leader>ca", "<cmd> call VSCodeNotify('editor.action.quickFix')<cr>" },
	{ "a", "<leader>cn", "<cmd> call VSCodeNotify('editor.action.rename')<cr>" },
	{ "a", "<leader>cf", "<cmd> call VSCodeNotify('editor.action.formatDocument')<cr>" },

	{ "a", "gpd", "<cmd> call VSCodeNotify('editor.action.peekDefinition')<cr>" },
	{ "a", "gpf", "<cmd> call VSCodeNotify('editor.action.peekDeclaration')<cr>" },
	{ "a", "gpr", "<cmd> call VSCodeNotify('editor.action.referenceSearch.trigger')<cr>" },
	{ "a", "gpi", "<cmd> call VSCodeNotify('editor.action.peekImplementation')<cr>" },
	{ "a", "go", "<cmd> call VSCodeNotify('workbench.action.gotoSymbol')<cr>" },

	{ "a", "<leader>eh", "<cmd>noh<cr>" },
}

local function map(table)
	for _, v in ipairs(table) do
		if v[1] == "a" then
			vim.api.nvim_set_keymap("n", v[2], v[3], {} or v[4])
			vim.api.nvim_set_keymap("x", v[2], v[3], {} or v[4])
			vim.api.nvim_set_keymap("v", v[2], v[3], {} or v[4])
		else
			vim.api.nvim_set_keymap(v[1], v[2], v[3], {} or v[4])
		end
	end
end

--
-- Options
--

local function setopt()
	g.mapleader = " "
	g.maplocalleader = " "

	g.python3_host_prog = "/usr/bin/python3"
	g.loaded_python_provider = 0
	g.loaded_ruby_provider = 0
	g.loaded_perl_provider = 0

	opt.shiftwidth = 4
	opt.tabstop = 4
	opt.softtabstop = 4
	opt.smartindent = true

	opt.writebackup = false
	opt.backup = false -- some language servers have issues with backup file
end

local M = {}

function M.setup()
	setopt()
	map(mapping)
end

return M
