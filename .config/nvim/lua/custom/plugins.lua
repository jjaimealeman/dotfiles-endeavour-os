-- $HOME/.config/nvim/lua/custom/plugins.lua
  -- Dec 18 2022

return function(use)

-- install my favorite color scheme
  use { "Mofiqul/dracula.nvim" }

-- installing a transparency plugin
  use({
    "xiyaowong/nvim-transparent",
    config = function()
      require("transparent").setup {
        enable = true,
        extra_groups = {
          "NvimTree",
          "NvimTreeFocus"
        }
      }
    end
  })
-- Autocmd for nvim-tree
vim.cmd("autocmd Colorscheme * highlight NvimTreeNormal guibg=none guifg=#205680")
  
-- install pocco81/auto-save.nvim
  use({
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {
        -- config goes here
        -- or leave it empty
      }
    end,
  })

-- install nvim-tree and icons
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

-- install bufferline
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

-- install nvim-autopairs
   use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup() end }

-- install which-key
 use({
    "folke/which-key.nvim",
      config = function()
        require("which-key").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      })
      end
  })

-- install emmet LSP
local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
lspconfig.emmet_ls.setup({
    -- on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        },
      },
    }
})

-- install alpha-nvim
  use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  }

-- install toggle-term
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup{
      direction = 'float',
      float_opts = {
        border = 'single'
      }
    }
  end}


end
