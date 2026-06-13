return {
  "oribarilan/lensline.nvim",
  --tag = "1.1.0", -- or: branch = 'release/1.x' for latest non-breaking updates
  event = "LspAttach",
  enabled = true,
  config = function()
    require("lensline").setup()
  end,
}
