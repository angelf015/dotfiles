return {
    "edr3x/better-escape.nvim",
    event = "BufReadPre",
    opts = {
        mapping = { "jk", "kj", "JK", "KJ", "jK", "kJ", "Jk", "Kj" },
        timeout = 120,
        clear_empty_lines = false,
        keys = "<Esc>",
        -- Configuración personalizada para limpiar búsqueda y snippets
        on_escape = function()
            vim.cmd("noh") -- limpia highlight de búsqueda
            local luasnip = require("luasnip")
            if luasnip and luasnip.in_snippet() then
                luasnip.unlink_current() -- detiene snippet actual
            end
        end,
    },
}
