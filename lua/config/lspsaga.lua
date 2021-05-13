local saga = require('lspsaga')
local utils = require('utils')
saga.init_lsp_saga{
	use_saga_diagnostic_sign = false
}
utils.nmap('gh', '<cmd>lua require("lspsaga.provider").lsp_finder()<cr>' )
utils.nmap('gp', '<cmd>lua require("lspsaga.provider").preview_definition()<cr>' )
utils.lmap('ca', '<cmd>lua require("lspsaga.codeaction").code_action()<cr>')
-- utils.nmap('K', '<cmd>lua require("lspsaga.hover").render_hover_doc()<cr>')
utils.nmap('gs', '<cmd>lua require("lspsaga.signatureHelp").signature_help()<cr>')
