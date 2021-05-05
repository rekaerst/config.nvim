vim.g['airline#extensions#tabline#enabled'] = 1
vim.g.airline_powerline_fonts = 1
vim.g.airline_section_b = '%{getcwd()}'
vim.cmd [[
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
]]
