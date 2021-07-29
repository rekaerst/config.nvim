require'compe'.setup {
	preselect = 'disable',
	source = {
		nvim_lsp = true,
		nvim_lua = true,
		path = true,
		buffer = true,
		calc = true,
		spell = true,
		emoji = true,
		vsnip = false,
	},
}

vim.cmd [[
imap <silent><expr> <C-Space> compe#complete()
imap <silent><expr> <C-y> compe#confirm()
imap <silent><expr> <C-f> compe#scroll({'delta': +4})
imap <silent><expr> <C-b> compe#scroll({'delta': -4})
]]
