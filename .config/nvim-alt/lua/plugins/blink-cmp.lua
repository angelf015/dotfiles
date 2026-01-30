return {
  "saghen/blink.cmp",
  event = "LspAttach",
  build = "cargo build --release",
  version = "1.*",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  },
  opts = {
    cmdline = { 
      enabled = false,
      show_icon = false,
    },
    fuzzy = {
      implementation = "prefer_rust",
    },
    snippets = {
      preset = "luasnip",
      expand = function(snippet) require("luasnip").lsp_expand(snippet) end,
      active = function(filter)
        if filter and filter.direction then
          return require("luasnip").jumpable(filter.direction)
        end
        return require("luasnip").in_snippet()
      end,
      jump = function(direction) require("luasnip").jump(direction) end,
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      providers = {
        snippets = {
          name = "snippets",
          module = "blink.cmp.sources.snippets",
          score_offset = 75,
          opts = {
            friendly_snippets = true,
          },
        },
      },
    },
    signature = {
      enabled = true,
      window = { border = "rounded" },
    },
    completion = {
      documentation = {
        auto_show = true,
        window = { border = "rounded" },
      },
      menu = { border = "rounded" },
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
    },
    appearance = {
      nerd_font_variant = "mono",
    },
  },
}