return {
  "zbirenbaum/copilot.lua",
  
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
