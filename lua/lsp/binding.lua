local M = {}
local opts = {
	noremap = true,
	silent = true
}
local utils = require('utils')
local nmap = utils.nmap
local bmap = utils.bmap

nmap('<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')

M.on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	bmap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
	bmap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
	bmap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
	bmap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
	bmap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
	bmap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
	bmap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>')

	-- Lspsaga
	bmap(bufnr, 'n', 'gd', '<cmd>lua require"lspsaga.provider".preview_definition()<CR>')
	bmap(bufnr, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>")
	bmap(bufnr, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>")
	bmap(bufnr, 'n', '<space>rn', '<cmd>Lspsaga rename<cr>')
	bmap(bufnr, 'n', '<space>ca', '<cmd>Lspsaga code_action<CR>')
	bmap(bufnr, 'n', 'K', '<cmd>Lspsaga hover_doc<CR>')
end
return M
