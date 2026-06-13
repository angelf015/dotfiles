return {
  "rasulomaroff/reactive.nvim",
  enabled = true,
  config = function()
    require("reactive").setup({
      load = { "catppuccin-mocha-cursor", "catppuccin-mocha-cursorline" },
    })
  end,
}
