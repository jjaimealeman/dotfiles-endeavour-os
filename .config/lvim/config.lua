--[[

TODO:
  Move plugins to:
  So that line:
  lvim.plugins = require "user.plugins"
  would load
  .config/lvim/lua/user/plugins.lua



Tue Nov 30 2021 12:30:21
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
-- lvim.colorscheme = "onedarker"
lvim.colorscheme = "dracula"

-- lvim.plugins = require "user.myplugins"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr><Esc>"
lvim.keys.normal_mode["<S-J>"] = "mzJ`z"
lvim.keys.normal_mode["<Tab>"] = ":bn<CR>"
lvim.keys.normal_mode["<S-Tab>"] = ":bp<CR>"
lvim.keys.normal_mode["<S-u>"] = "<C-r>"
lvim.keys.normal_mode["td"] = ":put =strftime('%a %b %d %Y %H:%M:%S')<Esc>"
lvim.keys.normal_mode["cp"] = ":let @+ = expand('%:p')<CR>" -- copy fullpath to clipboard
-- vim.api.nvim_set_keymap("i", "kj", "<Esc>")
lvim.keys.insert_mode["kj"] = "<Esc><Esc>:w<cr><Esc>"
-- lvim.undofile = false
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
lvim.builtin.telescope.pickers = { find_files = { hidden = true } } -- Show hidden files in results
lvim.builtin.telescope.defaults.file_ignore_patterns = {
  "^.git/",
  "%.git",
  "node_modules"
}
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
-- lvim.builtin.nvimtree.setup.hide_dotfiles = false
require'nvim-tree'.setup {
  filters = {
    dotfiles = false,
    custom = {}
  },
  update_focused_file = {
    enable      = true
  }
}

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "javascript",
    "json",
    "lua",
    "python",
    "typescript",
    "css",
    "rust",
    "java",
    "yaml",
    "html",             -- I ADDED THIS LINE
    "javascript"        -- I ADDED THIS LINE
}
require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<CR>',
            scope_incremental = '<CR>',
            node_incremental = '<TAB>',
            node_decremental = '<S-TAB>',
        },
    },
}


lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss
require'lspconfig'.tailwindcss.setup{}

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { exe = "black", filetypes = { "python" } },
--   { exe = "isort", filetypes = { "python" } },
--   {
--     exe = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { exe = "flake8", filetypes = { "python" } },
--   {
--     exe = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     args = { "--severity", "warning" },
--   },
--   {
--     exe = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }


require'nvim-tree'.setup {
  filters = {
    dotfiles = false,
    custom = {}
  }
}

-- Additional Plugins
lvim.plugins = {
--     {"folke/tokyonight.nvim"},
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
--  {"wakatime/vim-wakatime"},       -- :WakaTimeToday
  {"Pocco81/AutoSave.nvim"},        -- :
  {"Mofiqul/dracula.nvim"},
  {"lukas-reineke/indent-blankline.nvim"},
  {"mattn/emmet-vim"},
  {"ActivityWatch/aw-watcher-vim"},
--:AWStart - start logging if not already logging
--:AWStop - stop logging if logging
--:AWStatus - verify that the watcher is running
  {"hrsh7th/cmp-path"},
  {"ThePrimeagen/vim-be-good"},
  {"ap/vim-css-color"},
  {"Yilin-Yang/vim-markbar"},
  {"rafamadriz/friendly-snippets"},
  {"https://gitlab.com/code-stats/code-stats-vim.git"},
  {"unblevable/quick-scope"},
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
  }
}

require('cmp').setup ({
  sources = {
    { name = 'path' }
  }
})

--Map blankline
-- vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_char = '|'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = true
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_end_of_line = true,
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]


-- Autocommands (https://neovim.io/doc/user/autocmd.html)
--lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
--}

-- https://discord.com/channels/701530051140780102/704077577920446636/915508033990303745
vim.opt.cmdheight = 3
vim.opt.shortmess = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 25


lvim.autocommands.custom_groups = {
  { "BufWritePost    ", "*", ":echom 'File Saved: ' strftime('%F %b %T')" },
}

-- THESE ARE MY OWN SETTINGS
-- https://github.com/neovim/neovim/issues/12978#issuecomment-777041418
vim.cmd [[
  " All my indents and tabs settings
  set autoindent shiftwidth=2 smartindent tabstop=2 expandtab softtabstop=2

  set ai
  set clipboard=unnamed,unnamedplus
  set hlsearch
  set incsearch
  set ignorecase
  set noundofile
  set relativenumber
  set splitbelow
  set splitright
  nnoremap <leader>v :vsplit<cr>          " Split v
  nnoremap <leader>h :split<cr>           " Split h

  " Move a single line up/down with arrow keys
  nnoremap <S-Up> :m-2<CR>
  nnoremap <S-Down> :m+<CR>
  inoremap <S-Up> <Esc>:m-2<CR>
  inoremap <S-Down> <Esc>:m+<CR>
  nmap <leader>Q :bufdo bdelete<CR>

" Highlight multiple lines with 'V' and Shift J/K to move lines up and down
  xnoremap J :move '>+2<CR>gv-gv
  xnoremap K :move '<-2<CR>gv-gv
  let g:codestats_api_key = 'SFMyNTY.YW1waGFXMWxZV3hsYldGdSMjTVRVeU16Zz0.gXypkRW0EMCtSo0aTBvTymgzjgIRVY9gLPF4xbTe7Jk'

]]



-- https://www.reddit.com/r/neovim/comments/rcttuh/initvim_vs_initlua/hnykpnz/
-- local o = vim.o
-- local map = vim.api.nvim_set_keymap
-- local nore = { noremap = true, silent = true }

-- o.autoindent = true
-- o.shiftwidth = 2
-- o.smartindent = true
-- o.tabstop = 2
-- o.expandtab = true
-- o.softtabstop = 2

-- o.clipboard = "unnamed,unnamedplus"
-- o.hlsearch = true
-- o.incsearch = true
-- o.ignorecase = true
-- o.noundofile = true
-- o.relativenumber = true
-- o.scrolloff = 25
-- o.splitbelow = true
-- o.splitright = true

-- map("n", "<leader>v", ":vsplit<CR>", nore) -- Split v
-- map("n", "<leader>h", ":split<CR>", nore) -- Split h

-- -- Move a single line up/down with arrow keys
-- map("n", "<S-Up>", ":m-2<CR>", nore)
-- map("n", "<S-Down>", ":m+<CR>", nore)
-- map("i", "<S-Up>", "<ESC>:m-2<CR>", nore)
-- map("i", "<S-Down>", "<ESC>:m+<CR>", nore)

-- map("n", "<leader>Q", ":bufdo bdelete<CR>", { noremap = false, silent = true })

-- -- Highlight multiple lines with 'V' and Shift J/K to move lines up and down
-- map("x", "J", ":move '>+2<CR>gv-gv", nore)
-- map("x", "K", ":move '<-2<CR>gv-gv", nore)


-- {{{ TESTING CODE FOLDING

-- You may think that adding explicit comments to source code that describe folding is ugly at first. I thought the same way when I first saw it.
-- For most files I still think it's wrong. Not everyone uses the same editor, so littering your code with folding comments is just noisy to anyone
-- else looking at the code in something other than Vim.

---}}}
