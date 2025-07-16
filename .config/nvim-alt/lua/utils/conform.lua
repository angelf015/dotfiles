-- en tu archivo de utilidades
local M = {}

M.format = function(opts)
    require("conform").format(vim.tbl_deep_extend("force", {
        async = true,
        lsp_fallback = true,
        timeout_ms = 3000,
    }, opts or {}))
end

return M
