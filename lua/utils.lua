local utils = {}

local script_dir = vim.env.XDG_CONFIG_HOME .. '/nvim/lua/'

function utils.source(srcript)
	vim.cmd('source ' .. script_dir .. srcript .. '.vim')
end

function utils.hi(token, fg )
	vim.cmd('hi ' .. token .. ' guifg=' .. fg)
end

function utils.nmap(lh, rh)
	vim.api.nvim_set_keymap('n',lh,rh, {noremap = true, silent = true})
end

---
--- Nmap with leader key
---
function utils.lmap(lh, rh)
	vim.api.nvim_set_keymap('n','<leader>' .. lh,rh, {noremap = true, silent = true})
end

function utils.imap(lh, rh)
	vim.api.nvim_set_keymap('i',lh,rh, {silent = true})
end

---
--- map to both normal mode and insert mode
---
function utils.map(lh, rh)
	utils.nmap(lh, rh)
	utils.imap(lh, '<ESC>' .. rh .. 'i')
end


function utils.plugin_loaded(plugin_name)
	return packer_plugins[plugin_name] and packer_plugins[plugin_name].loaded
end

---
--- load lua module only if the corresponding plugin is loaded
---
function utils.config(module)
	if utils.plugin_loaded(module) or utils.plugin_loaded(module .. '.nvim') then
		require(module)
	end
end

local window_options = {
              arab = true;       arabic = true;   breakindent = true; breakindentopt = true;
               bri = true;       briopt = true;            cc = true;           cocu = true;
              cole = true;  colorcolumn = true; concealcursor = true;   conceallevel = true;
               crb = true;          cuc = true;           cul = true;     cursorbind = true;
      cursorcolumn = true;   cursorline = true;          diff = true;            fcs = true;
               fdc = true;          fde = true;           fdi = true;            fdl = true;
               fdm = true;          fdn = true;           fdt = true;            fen = true;
         fillchars = true;          fml = true;           fmr = true;     foldcolumn = true;
        foldenable = true;     foldexpr = true;    foldignore = true;      foldlevel = true;
        foldmarker = true;   foldmethod = true;  foldminlines = true;    foldnestmax = true;
          foldtext = true;          lbr = true;           lcs = true;      linebreak = true;
              list = true;    listchars = true;            nu = true;         number = true;
       numberwidth = true;          nuw = true; previewwindow = true;            pvw = true;
    relativenumber = true;    rightleft = true;  rightleftcmd = true;             rl = true;
               rlc = true;          rnu = true;           scb = true;            scl = true;
               scr = true;       scroll = true;    scrollbind = true;     signcolumn = true;
             spell = true;   statusline = true;           stl = true;            wfh = true;
               wfw = true;        winbl = true;      winblend = true;   winfixheight = true;
       winfixwidth = true; winhighlight = true;         winhl = true;           wrap = true;
}
local buffer_options = {
	smartindent = true;	tabstop = true;	shiftwidth = true;
}

local opt = {}
local mt = {}
function mt:__newindex(k, v)
	if window_options[k] then
		vim.wo[k] = v
	elseif buffer_options[k] then
		vim.bo[k] = v
	end
	vim.o[k] = v
end

function mt:__index(k)
	return vim.o[k]
end

setmetatable(opt, mt)
utils.opt = opt

return utils
