return {
  "barreiroleo/ltex_extra.nvim",
  ft = { "markdown", "org" },
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    require("ltex_extra").setup({
      -- Table <string> : languages for witch dictionaries will be loaded, e.g. { "es-AR", "en-US" }
      -- https://valentjn.github.io/ltex/supported-languages.html#natural-languages
      load_langs = { "es", "en-US" }, -- en-US as default
      -- boolean : whether to load dictionaries on startup
      init_check = true,
      -- string : relative or absolute path to store dictionaries
      -- e.g. subfolder in the project root or the current working directory: ".ltex"
      -- e.g. shared files for all projects: vim.fn.expand("~") .. "/.local/share/ltex"
      path = vim.fn.expand("~") .. "/.local/share/ltex",
      -- string : "none", "trace", "debug", "info", "warn", "error", "fatal"
      log_level = "info",
      -- Table : configurations of the ltex language server.
      -- Only if you are calling the server from ltex_extra
      server_opts = {
        settings = {
          ltex = {
            language = "es",
            additionalLanguages = { "en-US" },
          },
        },
      },
    })
  end,
}
