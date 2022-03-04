local utils = require('utils')
local symbols = utils.symbols

vim.lsp.protocol.CompletionItemKind = symbols

-- LSP Signs
local signdef = vim.fn.sign_define
signdef('DiagnosticSignError', {
	text = '',
	texthl = 'DiagnosticSignError',
	numhl = 'DiagnosticSignError'
})
signdef('DiagnosticSignWarn', {
	text = '',
	texthl = 'DiagnosticSignWarn',
	numhl = 'DiagnosticSignWarn'
})
signdef('DiagnosticSignInfo', {
	text = '',
	texthl = 'DiagnosticSignInfo',
	numhl = 'DiagnosticSignInfo'
})
signdef('DiagnosticSignHint', {
	text = '',
	texthl = 'DiagnosticSignHint',
	numhl = 'DiagnosticSignHint'
})

