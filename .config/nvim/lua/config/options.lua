-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Mantiene el cursor centrado verticalmente en la pantalla
-- vim.opt.scrolloff = 1000 -- Number of lines to leave before/after the cursor when scrolling. Setting a high value keep the cursor centered.
-- vim.opt.sidescrolloff = 8 -- Same but for side scrolling.
vim.opt.spelllang = { "en", "es" }

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "org" },
  callback = function()
    vim.opt_local.colorcolumn = "80" -- Cambiado a opt_local
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "es"
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local ft = vim.bo.filetype
    if ft ~= "markdown" and ft ~= "org" then
      vim.opt_local.colorcolumn = "120" -- Cambiado a opt_local
    end
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "javascript" or vim.bo.filetype == "typescript" then
      vim.opt_local.shiftwidth = 2
      vim.opt_local.tabstop = 2
    elseif vim.bo.filetype == "java" then
      vim.opt_local.shiftwidth = 4
      vim.opt_local.tabstop = 4
    end
  end,
})
