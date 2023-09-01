return {
  "Bryley/neoai.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  cmd = {
    "NeoAI",
    "NeoAIOpen",
    "NeoAIClose",
    "NeoAIToggle",
    "NeoAIContext",
    "NeoAIContextOpen",
    "NeoAIContextClose",
    "NeoAIInject",
    "NeoAIInjectCode",
    "NeoAIInjectContext",
    "NeoAIInjectContextCode",
  },
  keys = {
    -- { "<leader>as", desc = "summarize text" },
    -- { "<leader>ag", desc = "generate git message" },
    { "<C-a>", desc = "Summarize Text" },
  },
  config = function()
    require("neoai").setup({
      -- Options go here
    })
  end,
}
