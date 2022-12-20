-- $HOME/.config/nvim/after/plugin/defaults.lua

-- adding my own sensible defaults
-- vim.cmd [[colorscheme dracula]]
-- vim.cmd [[colorscheme onedark]]
vim.cmd [[colorscheme nightfox]]
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>")
-- vim.keymap.set("n", "tds", ":pu=strftime=('%c')<CR>")
vim.keymap.set("n", "tds", ":pu=strftime('%a %d %b %Y')<CR>")

-- toggle things
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")
vim.keymap.set("n", "<C-t>", ":ToggleTerm size=40 dir=git_dir direction=float<cr>")
vim.keymap.set("n", "<C-s>", ":ASToggle<CR>", {})
-- toggle transparency with :TransparentToggle

-- increment/decrement numbers
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>") -- Clear highlights
vim.keymap.set("n", "<ESC><ESC>", ":noh<CR>") -- Clear highlights

-- split window
vim.keymap.set("n", "sh", ":split<Return><C-w>w")
vim.keymap.set("n", "sv", ":vsplit<Return><C-w>w")

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")  -- to make this work, I had to disable 'vim.lsp.buf.signature_help' in 'init.lua'
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>")

-- keep highlighted line in center of page
vim.keymap.set("n", "k", "kzz")
vim.keymap.set("n", "<Up>", "kzz")
vim.keymap.set("n", "j", "jzz")
vim.keymap.set("n", "<Down>", "jzz")

-- keep highlighted search term in the center of page
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- move a single line up/down with "Shift up/down"
vim.keymap.set("n", "<S-Down>", ":m .+1<cr>")
vim.keymap.set("n", "<S-Up>", ":m .-2<cr>")
vim.keymap.set("n", "<S-Right>", ">>")
vim.keymap.set("n", "<S-Left>", "<<")

-- move a selection up/down with "Shift up/down"
vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv")
-- indent line with "Shift left/right"
vim.keymap.set("v", "<S-Right>", ">>")
vim.keymap.set("v", "<S-Left>", "<<")


-- undo and redo
vim.keymap.set("n", "<C-Z>", "u")
vim.keymap.set("n", "<C-Y>", "<C-R>")

-- greatest remap ever
-- "<leader>y" copies the buffer to the system clipboard for use elsewhere
-- https://youtu.be/w7i4amO_zaE?t=1633
-- vim.keymap.set("n", "<leader>y", "\"+y")
-- vim.keymap.set("v", "<leader>y", "\"+y")
-- vim.keymap.set("n", "<leader>y", "\"+Y")
vim.keymap.set("n", "y", "\"+y")
vim.keymap.set("v", "y", "\"+y")
vim.keymap.set("n", "y", "\"+Y")
vim.keymap.set("n", "yw", "bvey")               -- select and copy this word

-- press "<leader>f" to instantly search for the word you are on and find/replace
-- https://youtu.be/w7i4amO_zaE?t=1725
-- vim.keymap.set("n", "<leader>f", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>f", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]])

vim.opt.backup = false                          -- creates a backup file
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.incsearch = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8                           -- minimal number of screen lines to keep above and below the cursor
vim.opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
vim.opt.softtabstop = 4                         -- insert 4 spaces for a tab
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.tabstop = 4                             -- insert 4 spaces for a tab
-- UNCOMMENT THESE WHEN I INSTALL UNDOTREE
vim.opt.undodir = os.getenv("HOME") .. "~/.config/nvim/undodir"
vim.opt.undofile = true


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
    dotfiles = false,
  },
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  }
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

--

