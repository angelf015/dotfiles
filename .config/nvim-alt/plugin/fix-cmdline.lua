-- Fix para highlight de comando persistente
vim.api.nvim_create_autocmd("CmdlineLeave", {
  callback = function()
    -- Limpiar highlighting cuando sales del modo comando
    vim.cmd("clear")
  end,
})

-- También arreglar cuando presionas Enter
vim.api.nvim_create_autocmd("CmdlineEnter", {
  callback = function()
    -- Asegurarse de que no haya highlighting residual
    vim.cmd("clear")
  end,
})