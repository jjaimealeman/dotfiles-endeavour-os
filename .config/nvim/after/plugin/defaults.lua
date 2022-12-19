-- $HOME/.config/nvim/after/plugin/defaults.lua

-- Dec 18 2022
-- adding my own sensible defaults
-- vim.cmd [[colorscheme dracula]]
vim.cmd [[colorscheme onedark]]
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>")
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>") -- Clear highlights
vim.keymap.set("n", "<C-t>", ":ToggleTerm size=40 dir=git_dir direction=float<cr>")

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>")

-- keep highlightewd line in center of page
vim.keymap.set("n", "k", "kzz")
vim.keymap.set("n", "<Up>", "kzz")
vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "<Down>", "jzz")

-- move line up/down with shift up/down
vim.keymap.set("n", "<S-Down>", ":m .+1<cr>")
vim.keymap.set("n", "<S-Up>", ":m .-2<cr>")

-- undo and redo
vim.keymap.set("n", "<C-Z>", "u")
vim.keymap.set("n", "<C-Y>", "<C-R>")

vim.opt.backup = false                          -- creates a backup file
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.relativenumber = true
vim.opt.scrolloff = 8                           -- minimal number of screen lines to keep above and below the cursor
vim.opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.tabstop = 4                             -- insert 2 spaces for a tab


-- Nvim Tree Settings
-- examples for your init.lua
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
require("bufferline").setup{
  options = {
    modified_icon = '●',
    show_tab_indicators = true,
    always_show_bufferline = true,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        seperator = "true"
      }
    },
    highlights = {
      fill = {
        bg = {
          attribute = "fg",
          highlight = "Pmenu"
        }
      }
    }
  }
}

-- empty setup using defaults
-- require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- lsp setup for tailwind, taken from
-- https://dev.to/craftzdog/my-neovim-setup-for-react-typescript-tailwind-css-etc-58fb
local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end
mason.setup({
})
lspconfig.setup {
  ensure_installed = { "sumneko_lua", "tailwindcss" },
}
local nvim_lsp = require "lspconfig"
nvim_lsp.tailwindcss.setup {}

-- added emmet LSP from
--
