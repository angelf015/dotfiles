-- Plugin para activar el sistema de logging
return {
  name = "custom-logging",
  lazy = false,
  priority = 9999,
  config = function()
    local ok, logger = pcall(require, "config.logging")
    if not ok then
      vim.notify("No se pudo cargar el sistema de logging", vim.log.levels.WARN)
      return
    end
    
    logger.setup({
      enabled = true,
      level = "INFO",
      max_size = 1024 * 1024 * 10,
    })
    
    _G.Logger = logger
  end,
}
