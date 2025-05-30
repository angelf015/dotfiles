return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    indent = {
      indent = {
        enabled = false,
      },
      chunk = {
        enabled = true,
        char = {
          horizontal = "─",
          vertical = "│",
          corner_top = "╭",
          corner_bottom = "╰",
          arrow = "─",
        },
      },
    },
  },
}
