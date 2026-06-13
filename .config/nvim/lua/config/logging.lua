-- Sistema de logging para Neovim
-- Guardar como: ~/.config/nvim/lua/config/logging.lua

local M = {}

-- Configuración de logging
M.config = {
  enabled = true, -- Activar/desactivar logging
  log_file = vim.fn.stdpath("state") .. "/custom.log",
  level = "INFO", -- DEBUG, INFO, WARN, ERROR
  max_size = 1024 * 1024 * 10, -- 10MB máximo
}

-- Niveles de log
local levels = {
  DEBUG = 1,
  INFO = 2,
  WARN = 3,
  ERROR = 4,
}

-- Función para rotar logs si son muy grandes
local function rotate_log()
  local file = io.open(M.config.log_file, "r")
  if file then
    local size = file:seek("end")
    file:close()

    if size > M.config.max_size then
      local backup = M.config.log_file .. ".old"
      os.rename(M.config.log_file, backup)
    end
  end
end

-- Función principal de logging
function M.log(level, message, data)
  if not M.config.enabled then
    return
  end

  -- Verificar nivel de log
  if levels[level] < levels[M.config.level] then
    return
  end

  -- Rotar log si es necesario
  rotate_log()

  -- Abrir archivo en modo append
  local file = io.open(M.config.log_file, "a")
  if not file then
    return
  end

  -- Timestamp
  local timestamp = os.date("%Y-%m-%d %H:%M:%S")

  -- Formatear mensaje
  local log_entry = string.format("[%s] [%s] %s", timestamp, level, message)

  -- Agregar datos adicionales si existen
  if data then
    log_entry = log_entry .. " | " .. vim.inspect(data)
  end

  -- Escribir al archivo
  file:write(log_entry .. "\n")
  file:close()
end

-- Funciones de conveniencia
function M.debug(message, data)
  M.log("DEBUG", message, data)
end

function M.info(message, data)
  M.log("INFO", message, data)
end

function M.warn(message, data)
  M.log("WARN", message, data)
end

function M.error(message, data)
  M.log("ERROR", message, data)
end

-- Logging de eventos importantes
function M.setup_event_logging()
  -- Log cuando se abre un buffer
  vim.api.nvim_create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("custom_logging_bufenter", { clear = true }),
    callback = function(ev)
      M.debug("Buffer opened", {
        buffer = ev.buf,
        file = vim.api.nvim_buf_get_name(ev.buf),
        filetype = vim.bo[ev.buf].filetype,
      })
    end,
  })

  -- Log cuando ocurren cambios
  vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
    group = vim.api.nvim_create_augroup("custom_logging_textchanged", { clear = true }),
    callback = function(ev)
      M.debug("Text changed", {
        buffer = ev.buf,
        mode = vim.fn.mode(),
      })
    end,
  })

  -- Log cuando se guarda un archivo
  vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("custom_logging_write", { clear = true }),
    callback = function(ev)
      M.info("File saved", {
        file = vim.api.nvim_buf_get_name(ev.buf),
      })
    end,
  })

  -- Log cuando se adjunta LSP
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("custom_logging_lsp", { clear = true }),
    callback = function(ev)
      local client = vim.lsp.get_client_by_id(ev.data.client_id)
      M.info("LSP attached", {
        client = client and client.name or "unknown",
        buffer = ev.buf,
      })
    end,
  })

  -- Log errores de Neovim
  vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
      -- Sobrescribir vim.notify para capturar errores
      local original_notify = vim.notify
      vim.notify = function(msg, level, opts)
        -- Log según nivel
        if level == vim.log.levels.ERROR then
          M.error("Neovim error", { message = msg, opts = opts })
        elseif level == vim.log.levels.WARN then
          M.warn("Neovim warning", { message = msg, opts = opts })
        elseif level == vim.log.levels.INFO then
          M.info("Neovim info", { message = msg, opts = opts })
        end

        -- Llamar al notify original
        return original_notify(msg, level, opts)
      end
    end,
  })

  -- Log cuando se sale de Neovim
  vim.api.nvim_create_autocmd("VimLeavePre", {
    group = vim.api.nvim_create_augroup("custom_logging_exit", { clear = true }),
    callback = function()
      M.info("Neovim exiting normally")
    end,
  })
end

-- Comandos para ver logs
function M.setup_commands()
  -- Ver log completo
  vim.api.nvim_create_user_command("LogShow", function()
    vim.cmd("tabnew " .. M.config.log_file)
  end, { desc = "Mostrar log completo" })

  -- Ver últimas líneas del log
  vim.api.nvim_create_user_command("LogTail", function(opts)
    local lines = opts.args ~= "" and tonumber(opts.args) or 50
    local cmd = string.format("tabnew | read !tail -n %d %s", lines, M.config.log_file)
    vim.cmd(cmd)
  end, { nargs = "?", desc = "Mostrar últimas N líneas del log" })

  -- Limpiar log
  vim.api.nvim_create_user_command("LogClear", function()
    local file = io.open(M.config.log_file, "w")
    if file then
      file:write("")
      file:close()
      M.info("Log cleared")
      vim.notify("Log limpiado", vim.log.levels.INFO)
    end
  end, { desc = "Limpiar log completamente" })

  -- Cambiar nivel de log
  vim.api.nvim_create_user_command("LogLevel", function(opts)
    local level = opts.args:upper()
    if levels[level] then
      M.config.level = level
      M.info("Log level changed to " .. level)
      vim.notify("Nivel de log cambiado a: " .. level, vim.log.levels.INFO)
    else
      vim.notify("Nivel inválido. Usa: DEBUG, INFO, WARN, ERROR", vim.log.levels.ERROR)
    end
  end, { nargs = 1, desc = "Cambiar nivel de logging" })

  -- Toggle logging
  vim.api.nvim_create_user_command("LogToggle", function()
    M.config.enabled = not M.config.enabled
    local status = M.config.enabled and "activado" or "desactivado"
    M.info("Logging " .. status)
    vim.notify("Logging " .. status, vim.log.levels.INFO)
  end, { desc = "Activar/desactivar logging" })

  -- Ver ubicación del log
  vim.api.nvim_create_user_command("LogPath", function()
    vim.notify("Log file: " .. M.config.log_file, vim.log.levels.INFO)
    -- Copiar al clipboard
    vim.fn.setreg("+", M.config.log_file)
  end, { desc = "Mostrar ruta del archivo de log" })
end

-- Setup completo
function M.setup(opts)
  -- Aplicar configuración personalizada
  if opts then
    M.config = vim.tbl_deep_extend("force", M.config, opts)
  end

  -- Configurar logging de eventos
  if M.config.enabled then
    M.setup_event_logging()
  end

  -- Configurar comandos
  M.setup_commands()

  -- Log inicial
  M.info("Logging system initialized", {
    level = M.config.level,
    file = M.config.log_file,
  })
end

return M
