return {
  "python-lsp/python-lsp-server",
  opts = {
    cmd = { "pylsp" },
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            enabled = true,
            maxLineLength = 120,
          },
          pyflakes = { enabled = true },
          mccabe = {
            enabled = true,
            threshold = 15,
          },
          autopep8 = { enabled = false },
          yapf = { enabled = false },
          jedi_completion = {
            enabled = true,
            include_params = true,
          },
          jedi_definition = { enabled = true, follow_imports = true },
          jedi_hover = { enabled = true },
          jedi_references = { enabled = true },
          jedi_signature_help = { enabled = true },
          jedi_symbols = { enabled = true, all_scopes = true },
          rope_completion = { enabled = false },
          rope_autoimport = { enabled = false },
        },
      },
    },
  },
}