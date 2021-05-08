local util = require('utils')

vim.cmd('lua dap=require(\'dap\')')
util.map('<F5>', '<cmd>lua dap.continue()<CR>')
util.map('<F9>', '<cmd>lua dap.toggle_breakpoint()<CR>')
util.map('<F10>', '<cmd>lua dap.step_over()<CR>')
util.map('<F11>', '<cmd>lua dap.step_into()<CR>')
util.map('<F23>', '<cmd>lua dap.step_out()<CR>')
