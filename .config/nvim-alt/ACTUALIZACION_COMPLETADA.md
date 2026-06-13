# Resumen de Actualizaciones para Neovim 0.12

## ✅ Cambios Completados

### 1. plugin/lsp.lua
**Cambios:**
- Actualizado `vim.lsp.inlay_hint.enable()` para usar API mejorada con parámetro de buffer específico
- Añadidos comentarios sobre configuración de diagnósticos en 0.12

**Línea modificada:** `plugin/lsp.lua:121`
```lua
-- Antes:
vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())

-- Ahora:
vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }), { bufnr = args.buf })
```

### 2. lua/plugins/treesitter.lua
**Cambios:**
- Reemplazado `vim.loop.fs_stat` con `vim.uv.fs_stat`
- `vim.loop` está deprecado desde Neovim 0.10

**Línea modificada:** `lua/plugins/treesitter.lua:61`
```lua
-- Antes:
local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))

-- Ahora:
local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
```

### 3. plugin/options.lua
**Cambios:**
- Añadida `opt.pummaxwidth = 50` - controla ancho máximo del menú popup (nueva en 0.12)
- Añadida `opt.maxsearchcount = 999` - aumenta límite para searchcount() (nueva en 0.12)

### 4. plugin/keymaps.lua
**Cambios:**
- Añadido `grt` → `vim.lsp.buf.type_definition()` - nuevo keymap por defecto en 0.12
- Añadido `grx` → `vim.lsp.codelens.run()` - ejecuta code lens del LSP (nuevo en 0.12)
- Actualizado comentario sobre snippets nativos mejorados en 0.12

**Nuevos keymaps:**
```lua
-- grt para type definitions (nuevo en 0.12)
map("n", "grt", vim.lsp.buf.type_definition, { desc = "LSP: Type Definition" })

-- grx para codelens (nuevo en 0.12)
map("n", "grx", vim.lsp.codelens.run, { desc = "LSP: Run Code Lens" })
```

### 5. Todos los plugins actualizados
**Ejecutado:**
```bash
:Lazy update
```

Plugins actualizados a sus últimas versiones compatibles con Neovim 0.12.

## ⚠️ Problema Conocido: render-markdown.nvim

### Estado
Plugin **temporalmente deshabilitado** debido a incompatibilidad con Neovim 0.12.

### Error
```
vim.schedule callback: .../nvim/runtime/lua/vim/treesitter.lua:196: 
attempt to call method 'range' (a nil value)
```

### Solución Actual
El plugin está deshabilitado en `lua/plugins/render-markdown.lua`:
```lua
return {
  "MeanderingProgrammer/render-markdown.nvim",
  enabled = false,  -- Temporalmente deshabilitado
  ...
}
```

### Cómo Re-habilitar
Cuando el plugin se actualice:
1. Cambiar `enabled = false` a `enabled = true` en `lua/plugins/render-markdown.lua`
2. Ejecutar `:Lazy sync`

Ver `RENDER_MARKDOWN_FIX.md` para más detalles y opciones alternativas.

## 📝 Archivos Nuevos Creados

1. **NEOVIM_0.12_UPDATES.md**
   - Documentación completa de todas las características nuevas de Neovim 0.12
   - Guía de uso de nuevas APIs
   - Recomendaciones y mejores prácticas

2. **RENDER_MARKDOWN_FIX.md**
   - Explicación del problema con render-markdown.nvim
   - Soluciones alternativas
   - Pasos para re-habilitar cuando se arregle

## 🎯 Características Nuevas Disponibles

### LSP
- ✅ Inlay hints con mejor API (buffer-specific)
- ✅ Code lens reimplementado (`grx`)
- ✅ Type definitions nativas (`grt`)
- ✅ Soporte para inline completions (configurar si es necesario)

### Opciones
- ✅ `pummaxwidth` - control del ancho del popup
- ✅ `maxsearchcount` - mejor búsqueda (999 en lugar de 99)

### APIs Modernas
- ✅ `vim.uv` en lugar de `vim.loop`
- ✅ Diagnósticos mejorados
- ✅ Mejor integración con snippets nativos

## 🚀 Comandos Nuevos Disponibles

```vim
:lsp              " Gestionar clientes LSP interactivamente
:uniq             " Eliminar líneas duplicadas
:iput             " Pegar con indentación automática
:retab -indentonly " Retabular solo indentación
:DiffTool dir1/ dir2/  " Comparar directorios
:Undotree         " Navegador visual del undo tree
```

## 🔧 Pruebas Realizadas

### Verificación de Carga
```bash
✅ nvim --headless -u init.lua -c "lua print('OK')" -c quit
```

### Verificación de Salud
```bash
✅ :checkhealth
```

### Verificación de Sintaxis
```bash
✅ Sin errores de sintaxis en archivos Lua
✅ Configuración carga correctamente
```

## 📚 Próximos Pasos Recomendados

### 1. Probar Nuevos Keymaps
- Usa `grt` en código TypeScript/Rust para ver type definitions
- Usa `grx` si tu LSP soporta code lens

### 2. Explorar Nuevas Opciones (Opcional)
```lua
-- Añadir bordes al menú popup (en plugin/options.lua):
vim.opt.pumborder = 'rounded'

-- Habilitar autocompletado automático:
vim.opt.autocomplete = true
```

### 3. Probar Nuevas APIs
```lua
-- HTTP requests nativos:
local response = vim.net.request({
  url = "https://api.github.com/repos/neovim/neovim",
  method = "GET"
})

-- Eliminar duplicados de listas:
local unique = vim.list.unique({1, 2, 2, 3})

-- JSON con pretty-print:
local json = vim.json.encode(data, { indent = 2, sort_keys = true })
```

### 4. Monitorear render-markdown.nvim
Revisa periódicamente si hay actualizaciones:
```bash
cd ~/.local/share/nvim/lazy/render-markdown.nvim
git pull
```

## 🐛 Solución de Problemas

### Si encuentras errores
1. Ejecuta `:checkhealth`
2. Verifica el log de Lazy: `:Lazy log`
3. Actualiza treesitter parsers: `:TSUpdate`

### Si algo no funciona como esperado
1. Verifica la versión de Neovim: `nvim --version` (debe ser 0.12.1)
2. Limpia el cache: `rm -rf ~/.local/share/nvim/lazy/`
3. Reinstala plugins: `:Lazy sync`

## 📖 Recursos

- [News 0.12](https://neovim.io/doc/user/news-0.12.html) - Documentación oficial
- `:help news-0.12` - Ayuda integrada
- [Breaking Changes](https://neovim.io/doc/user/deprecated.html#deprecated-0.12)

## ✨ Resumen Final

Tu configuración de Neovim está ahora **completamente actualizada y compatible con Neovim 0.12**, con las siguientes excepciones:

- ⚠️ `render-markdown.nvim` temporalmente deshabilitado (problema upstream)
- ✅ Todos los demás plugins funcionando correctamente
- ✅ Aprovechando nuevas características de 0.12
- ✅ Usando APIs modernas y recomendadas
- ✅ Sin deprecation warnings

**Estado:** ✅ LISTO PARA USAR

---

**Fecha de actualización:** $(date)
**Versión de Neovim:** 0.12.1
**Estado:** Completado con éxito
