local utils = require('utils')
require('plugins')
require('color')

utils.source('keymap')

vim.wo.number = true -- enable line number
vim.o.number = true -- enable line number
vim.wo.signcolumn = "number"
vim.o.signcolumn = "number"
vim.o.mouse = 'a'
vim.o.wildmode = 'longest:full,full'
vim.o.termguicolors = true
vim.o.splitbelow = true
vim.o.hidden = true
vim.o.shortmess = vim.o.shortmess .. "cI"
vim.o.signcolumn = "number"
vim.o.timeoutlen = 400
vim.o.inccommand = 'nosplit'

vim.o.smartindent = true
vim.bo.smartindent = true
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4


-- airline
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g.airline_powerline_fonts = 1
vim.g.airline_section_b = '%{getcwd()}'

-- nvim providers
vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- coc nvim
vim.o.backup = false -- some language servers have issues with backup file
vim.o.writebackup = false
vim.o.updatetime = 300 -- having longer updatetime leads to noticeable delays
vim.g.coc_data_home = vim.env.HOME .. '/.local/share/coc'

-- misc plugins
vim.g.rainbow_active = 1
vim.g.indent_guides_enable_on_vim_startup = 1
vim.g.indent_guides_auto_colors = 0
vim.g.rainbow_conf = {separately = {html = 0}}

-- debugger adapter protocol
local dap = require('dap')
dap.adapters.python = {
  type = 'executable';
  command = '/usr/bin/python';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
		return '/usr/bin/python'
    end;
  },
}

dap.adapters.go = function(callback, config)
    local handle
    local pid_or_err
    local port = 38697
    handle, pid_or_err =
      vim.loop.spawn(
      "dlv",
      {
        args = {"dap", "-l", "127.0.0.1:" .. port},
        detached = true
      },
      function(code)
        handle:close()
        print("Delve exited with exit code: " .. code)
      end
    )
    -- Wait 100ms for delve to start
    vim.defer_fn(
      function()
        --dap.repl.open()
        callback({type = "server", host = "127.0.0.1", port = port})
      end,
      100)


    --callback({type = "server", host = "127.0.0.1", port = port})
  end
  -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
    {
      type = "go",
      name = "Debug",
      request = "launch",
      program = "${file}"
    }
}

require('nvim-treesitter.configs').setup ({
  ensure_installed = {"bash","c", "clojure", "cpp", "css", "go", "gdscript", "haskell", "html",
  "javascript", "java", "latex", "lua", "python", "r", "regex", "rust", "typescript", "vue"},
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  playground = {
    enable = true,
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
  rainbow = {
	enable = true,
	extended_mode = true,
	max_file_lines = 1000,
  }
})
