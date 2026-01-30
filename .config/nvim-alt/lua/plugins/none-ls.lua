return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    event = "LspAttach",
    config = function()
        local nls = require("null-ls")
        nls.setup({
            debug = false,
            sources = {
                -- Solo mantener diagnósticos, no formatters
                nls.builtins.diagnostics.yamllint.with({
                    args = {
                        "-d",
                        [[
                                {
                                    extends: relaxed,
                                    rules: {
                                        line-length: disable,
                                        comments-indentation: disable,
                                        indentation: {
                                            spaces: 2
                                        }
                                    }
                                }
                            ]],
                        "--format",
                        "parsable",
                        "-",
                    },
                }),
            },
        })
    end,
}
