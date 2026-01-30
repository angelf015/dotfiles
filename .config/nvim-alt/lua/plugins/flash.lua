return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    -- options for the flash.nvim plugin
    modes = {
      -- search mode
      search = {
        enabled = true,
        highlight = { backdrop = false },
        jump = { history = true, register = true },
        search = {
          -- search forward/backward in f/t mode
          forward = true,
          -- wrap around the end of the buffer
          wrap = true,
          -- multi-window search
          multi_window = true,
          -- function to get label for matches
          label = function(match)
            -- return label for match
            return match.label
          end,
        },
      },
      -- char mode (f/t/F/T)
      char = {
        enabled = true,
        -- dynamic configuration for char mode
        config = function(keys)
          -- customize char mode behavior
          return {
            -- jump when there's only one match
            auto_jump = false,
            -- when to jump
            jump_labels = true,
            -- when to show labels
            label = keys ~= "f" and keys ~= "t",
          }
        end,
        -- highlight for matches
        highlight = { backdrop = true },
        -- jump behavior
        jump = { register = false },
      },
      -- treesitter mode (for more precise jumps)
      treesitter = {
        labels = "abcdefghijklmnopqrstuvwxyz",
        jump = { pos = "range" },
        search = { incremental = false },
        highlight = { backdrop = false, matches = false },
      },
    },
    -- appearance
    appearance = {
      -- show flash label
      show_label = true,
      -- show backdrop
      show_backdrop = true,
      -- highlight groups
      label = {
        fg = "#ff966c",
        bg = "NONE",
        bold = true,
      },
      match = {
        fg = "#cdd6f4",
        bg = "#313244",
        bold = true,
      },
      backdrop = {
        bg = "#1e1e2e",
      },
      current = {
        fg = "#f9e2af",
        bg = "#313244",
        bold = true,
      },
    },
  },
  keys = {
    -- Flash forward (like f)
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    -- Flash backward (like F)
    {
      "S",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({ backward = true })
      end,
      desc = "Flash Backward",
    },
    -- Flash treesitter mode
    {
      "r",
      mode = "o",
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    -- Flash with remote jump
    {
      "R",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Treesitter Search",
    },
    -- Toggle flash search
    {
      "<c-s>",
      mode = { "c" },
      function()
        require("flash").toggle()
      end,
      desc = "Toggle Flash Search",
    },
  },
}