-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.opt.colorcolumn = "120"
vim.opt.number = false
vim.opt.relativenumber = false
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "org" },
  callback = function()
    vim.opt.colorcolumn = "80"
    vim.opt.spell = true
    vim.opt.spelllang = "es"
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local ft = vim.bo.filetype
    if ft ~= "markdown" and ft ~= "org" then
      vim.opt.colorcolumn = "120"
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
