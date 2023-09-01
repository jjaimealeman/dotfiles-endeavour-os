return {
  "Edeneast/nightfox.nvim",
  lazy = false, -- make sure we load this during setup if it is your maincolorscheme
  priority = 1000, -- make sure we load this before all the other start plugins
  config = function()
    -- load the colorscheme here
    vim.cmd([[colorscheme nightfox]])
  end,
}
