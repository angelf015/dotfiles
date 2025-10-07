return {
  "zbirenbaum/copilot.lua",
  optional = true,
  enabled = false,
  opts = function()
    require("copilot.api").status = require("copilot.status")
  end,
  config = function()
    require("copilot").setup({
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      },
    })
  end,
}
