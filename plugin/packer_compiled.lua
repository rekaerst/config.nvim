-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/arthur/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/arthur/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/arthur/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/arthur/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/arthur/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["auto-pairs"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/opt/auto-pairs"
  },
  ["barbar.nvim"] = {
    config = { 'require("config.barbar")' },
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  edge = {
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/edge"
  },
  fzf = {
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim"
  },
  kommentary = {
    loaded = false,
    needs_bufread = false,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/opt/kommentary"
  },
  ["lsp-status.nvim"] = {
    config = { 'require("config.lsp-status")' },
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/lsp-status.nvim"
  },
  ["lsp-trouble.nvim"] = {
    config = { 'require("config.lsp-trouble")' },
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/lsp-trouble.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { 'require("config.lsp_signature")' },
    loaded = false,
    needs_bufread = false,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { 'require("config.lspsaga")' },
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { 'require("config.lualine")' },
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim"
  },
  ["nlua.nvim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/opt/nlua.nvim"
  },
  ["nvim-autopairs"] = {
    config = { 'require("config.auto-pairs")' },
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-compe"] = {
    config = { 'require("config.compe")' },
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-dap"] = {
    config = { 'require("config.dap")' },
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-luapad"] = {
    commands = { "Luapad" },
    loaded = false,
    needs_bufread = false,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/opt/nvim-luapad"
  },
  ["nvim-tree.lua"] = {
    config = { 'require("config.tree")' },
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { 'require("config.treesitter")' },
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/octo.nvim"
  },
  ["one-nvim"] = {
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/one-nvim"
  },
  ["onedark.vim"] = {
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/onedark.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    commands = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
    loaded = false,
    needs_bufread = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/opt/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  sniprun = {
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/sniprun"
  },
  tagbar = {
    commands = { "Tagbar" },
    loaded = false,
    needs_bufread = false,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/opt/tagbar"
  },
  ["telescope-dap.nvim"] = {
    config = { 'require("config.telescope-dap")' },
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim"
  },
  ["telescope-packer.nvim"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/opt/telescope-packer.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-packer.nvim" },
    loaded = true,
    only_config = true
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    config = { "vim.g.undotree_SetFocusWhenToggle = 1" },
    loaded = false,
    needs_bufread = false,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/opt/undotree"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/vim-closetag"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-dadbod"] = {
    commands = { "DB", "DBUI" },
    loaded = false,
    needs_bufread = false,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/opt/vim-dadbod"
  },
  ["vim-dadbod-ui"] = {
    commands = { "DBUI" },
    loaded = false,
    needs_bufread = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/opt/vim-dadbod-ui"
  },
  ["vim-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/opt/vim-devicons"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-hexokinase"] = {
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/vim-hexokinase"
  },
  ["vim-indent-guides"] = {
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/vim-indent-guides"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/vim-startuptime"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/arthur/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require("config.treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
require("config.tree")
time([[Config for nvim-tree.lua]], false)
-- Config for: barbar.nvim
time([[Config for barbar.nvim]], true)
require("config.barbar")
time([[Config for barbar.nvim]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
require("config.compe")
time([[Config for nvim-compe]], false)
-- Config for: lsp-status.nvim
time([[Config for lsp-status.nvim]], true)
require("config.lsp-status")
time([[Config for lsp-status.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require("config.telescope")
time([[Config for telescope.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require("config.lualine")
time([[Config for lualine.nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
require("config.lspsaga")
time([[Config for lspsaga.nvim]], false)
-- Config for: telescope-dap.nvim
time([[Config for telescope-dap.nvim]], true)
require("config.telescope-dap")
time([[Config for telescope-dap.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
require("config.dap")
time([[Config for nvim-dap]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require("config.auto-pairs")
time([[Config for nvim-autopairs]], false)
-- Config for: lsp-trouble.nvim
time([[Config for lsp-trouble.nvim]], true)
require("config.lsp-trouble")
time([[Config for lsp-trouble.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd telescope-packer.nvim ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DB lua require("packer.load")({'vim-dadbod'}, { cmd = "DB", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Luapad lua require("packer.load")({'nvim-luapad'}, { cmd = "Luapad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSHighlightCapturesUnderCursor lua require("packer.load")({'playground'}, { cmd = "TSHighlightCapturesUnderCursor", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSPlaygroundToggle lua require("packer.load")({'playground'}, { cmd = "TSPlaygroundToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Tagbar lua require("packer.load")({'tagbar'}, { cmd = "Tagbar", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DBUI lua require("packer.load")({'vim-dadbod', 'vim-dadbod-ui'}, { cmd = "DBUI", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
