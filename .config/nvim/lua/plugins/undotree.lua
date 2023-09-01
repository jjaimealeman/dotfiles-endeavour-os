return {
  "mbbill/undotree",
  lazy = false, -- make sure we load this during setup if it is your maincolorscheme
  cmd = { "UndotreeShow", "UndotreeToggle", "UndotreeHide", "UndotreeFocus" },
  keys = { { "<C-u>", ":UndotreeToggle<cr>", desc = "UndotreeToggle" } },
}
