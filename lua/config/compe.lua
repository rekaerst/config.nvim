require'compe'.setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = 'enable',
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,

  source = {
    path = true,
    buffer = true,
    calc = true,
    spell = true,
    emoji = true,
    nvim_lsp = true,
    nvim_lua = true,
    vsnip = false,
  },
}

vim.cmd [[
imap <silent><expr> <C-Space> compe#complete()
imap <silent><expr> <C-e> compe#close('<C-e>')
imap <silent><expr> <C-f> compe#scroll({'delta': +4})
imap <silent><expr> <C-b> compe#scroll({'delta': -4})
]]
