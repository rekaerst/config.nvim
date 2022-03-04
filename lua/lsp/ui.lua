local u = require('utils')

vim.lsp.protocol.CompletionItemKind = u.symbols

-- LSP Signs
u.signdef('DiagnosticSignError', {
	text = '',
	texthl = 'DiagnosticSignError',
	numhl = 'DiagnosticSignError'
})
u.signdef('DiagnosticSignWarn', {
	text = '',
	texthl = 'DiagnosticSignWarn',
	numhl = 'DiagnosticSignWarn'
})
u.signdef('DiagnosticSignInfo', {
	text = '',
	texthl = 'DiagnosticSignInfo',
	numhl = 'DiagnosticSignInfo'
})
u.signdef('DiagnosticSignHint', {
	text = '',
	texthl = 'DiagnosticSignHint',
	numhl = 'DiagnosticSignHint'
})

