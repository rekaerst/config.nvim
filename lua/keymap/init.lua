function nmap(lh, rh)
	vim.api.nvim_set_keymap('n',lh,rh, {noremap = true, silent = true})
end

function imap(lh, rh)
	vim.api.nvim_set_keymap('i',lh,rh, {silent = true})
end
-- vim native keymap
require('keymap.vim')
-- nvim-tree
require("keymap.tree")
