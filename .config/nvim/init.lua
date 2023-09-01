-- init.lua
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- require("cmp").config.formatting = {
--   format = require("tailwindcss-colorizer-cmp").formatter,
-- }

require("cmp").setup({
  formatting = { format = require("tailwindcss-colorizer-cmp").formatter },
})
