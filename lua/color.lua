local u = require('utils')
vim.cmd('syntax enable')

function colorscheme_nightfox()
	vim.cmd 'colorscheme nightfox'
	local nightfox = require 'nightfox'
	nightfox.load 'nordfox'
	nightfox.setup {
		styles = {
			comments = "italic", -- change style of comments to be italic
			keywords = "bold" -- change style of keywords to be bold
		}
	}
end

function colorscheme_tokyonight()
	vim.cmd 'colorscheme tokyonight'
end

function colorscheme_onedark()
	vim.cmd 'colorscheme onedark'
end

colorscheme_onedark()

-- Indent guide
vim.cmd("autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#3B374A ctermbg=3")
vim.cmd("autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#2E3F49 ctermbg=4")

-- Highlight on yank
vim.cmd('au TextYankPost * silent! lua vim.highlight.on_yank()')

-- semantic highlight
if vim.g.colors_name == "onedark" then
	u.hi('Keyword', '#C678DD')
	u.hi('TSParameter', '#ABB2BF')
	u.hi('TSConstructor', '#E5C07B')
	u.hi('Operator', '#7680EF')
	u.hi('Include', '#C678DD')
	u.hi('TSFuncMacro', '#61DEEF')
	u.hi('TSFuncBuiltin', '#56B6C2')
	u.hi('pythonTSVariableBuiltin', '#E5C07B')
	-- vim.cmd 'hi Identifier guifg=#ABB2BF'
end

vim.cmd [[ 
hi Comment gui=italic 
hi CursorLineNR guifg=#9794e8
]]
