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
_G.compe_parenthesis_fix = function()
  if vim.fn.pumvisible() then
    vim.cmd [[ call timer_start(0, { -> luaeval('require"compe"._close()') }) ]]
  end
  return t "("
end
vim.api.nvim_set_keymap("i", "(", "v:lua.compe_parenthesis_fix()", {expr = true})

