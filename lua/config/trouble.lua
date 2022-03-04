local trouble = require 'trouble'
local utils = require 'utils'
local nmap = utils.nmap

trouble.setup()

nmap("<leader>xx", "<cmd>Trouble<cr>")
nmap("<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>")
nmap("<leader>xd", "<cmd>Trouble document_diagnostics<cr>")
nmap("<leader>xl", "<cmd>Trouble loclist<cr>")
nmap("<leader>xq", "<cmd>Trouble quickfix<cr>")
nmap("gr", "<cmd>Trouble lsp_references<cr>")
