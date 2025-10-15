return {
  "sschleemilch/slimline.nvim",
  enabled = false,
  opts = {
    bold = false, -- makes primary parts bold

    -- Global style. Can be overwritten using `configs.<component>.style`
    style = "bg", -- "bg" or "fg"

    configs = {
      mode = {
        -- Only rounded: path, git, filetype_lsp
        path = {
          hl = {
            primary = "Define",
          },
        },
        git = {
          hl = {
            primary = "Function",
          },
        },
        filetype_lsp = {
          hl = {
            primary = "String",
          },
        },
        verbose = true, -- Mode as single letter or as a word
        hl = {
          normal = "Type",
          insert = "String",
          pending = "Boolean",
          visual = "Keyword",
          command = "Function",
        },
      },
    },
    -- spaces = {
    --   components = "",
    --   left = "",
    --   right = "",
    -- },
    --
    -- -- Seperator configuartion
    -- sep = {
    --   hide = {
    --     first = false, -- hides the first separator of the line
    --     last = false, -- hides the last separator of the line
    --   },
    --   -- left = "", -- left separator of components
    --   -- right = "", -- right separator of components
    --   left = "",
    --   right = "",
    -- },
  },
}
