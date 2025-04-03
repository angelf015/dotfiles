return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    indent = {
      priority = 1,
      enabled = true, -- enable indent guides
      char = "│",
      only_current = true, -- only show indent guides in the current window
      only_scope = true, -- only show indent guides of the scope
      hl = "SnacksIndent", ---@type string|string[] hl groups for indent guides
    },
  },
}
