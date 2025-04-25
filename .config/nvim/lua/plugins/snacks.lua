return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    indent = {
      priority = 1,
      enabled = true, -- enable indent guides
      char = "│",
      only_current = true, -- Only show indent guides in the current window
      only_scope = true, -- Only show indent guides of the scope
      hl = "SnacksIndent", ---@type string|string[] hl groups for indent guides
    },
  },
}
