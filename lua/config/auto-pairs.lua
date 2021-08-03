local npairs = require("nvim-autopairs")
npairs.setup({
	fast_wrap = {},
})

local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

-- skip it, if you use another global object
_G.MUtils= {}

MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
      return npairs.esc("<cr>")
  else
    return npairs.autopairs_cr()
  end
end
remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})

-- Workaround compe
local parenthesis_rule = npairs.get_rule("(")
parenthesis_rule:with_pair(function()
  if vim.fn.pumvisible() then
    vim.cmd([[ call timer_start(0, { -> luaeval('require"compe"._close()') }) ]])
  end
  return true
end)
