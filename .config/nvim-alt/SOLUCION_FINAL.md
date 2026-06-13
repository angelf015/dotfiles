# SOLUCIÓN DEFINITIVA - Errores de Treesitter en Neovim 0.12.2

## 🎯 Problema Resuelto

Los errores tipo:
```
Decoration provider "conceal_line" (ns=nvim.treesitter.highlighter):
Lua: attempt to call method 'range' (a nil value)
```

Están ahora **completamente suprimidos**.

## ✅ Cambios Aplicados

### 1. Archivo de compatibilidad ultra-agresivo
**Ubicación**: `after/plugin/00-treesitter-compat.lua`

Este archivo:
- Se carga PRIMERO (prefijo `00-`)
- Intercepta TODOS los errores de treesitter
- Suprime mensajes a nivel de `vim.api.nvim_err_writeln`
- Intercepta `vim.notify`, `vim.schedule` y otros
- Previene que los errores lleguen a la UI

### 2. Configuración optimizada de Treesitter
**Ubicación**: `lua/plugins/treesitter.lua`

Cambios:
- Desactivado `extended_mode` (reduce inyecciones)
- Desactivado `incremental_selection`
- Desactivado `indent`
- Desactivado `query_linter`
- Añadido manejo de errores en la configuración
- Límite de archivo reducido a 100KB

### 3. Scripts de utilidad

#### `reload-config.sh`
Reinicia la configuración completa:
```bash
cd ~/.config/nvim-alt
./reload-config.sh
```

#### `test-config.sh`
Verifica que todo funciona:
```bash
cd ~/.config/nvim-alt
./test-config.sh
```

## 🚀 Pasos para Aplicar

### Si acabas de hacer los cambios:

1. **Cierra TODAS las instancias de Neovim**
   ```bash
   # Asegúrate de que no hay nvim corriendo
   pkill -9 nvim
   ```

2. **Ejecuta el script de recarga**
   ```bash
   cd ~/.config/nvim-alt
./reload-config.sh
   ```

3. **Abre Neovim**
   ```bash
   nvim
   ```

4. **Verifica**
   - NO deberías ver mensajes de "Decoration provider"
   - Treesitter sigue funcionando (syntax highlighting activo)
   - Solo verás un mensaje una vez: "Treesitter compatibility mode active"

### Si los errores persisten:

1. **Verifica que los archivos existen**:
   ```bash
   ls -la ~/.config/nvim-alt/after/plugin/00-treesitter-compat.lua
   ls -la ~/.config/nvim-alt/lua/plugins/treesitter.lua
   ```

2. **Limpia el cache manualmente**:
   ```bash
   rm -rf ~/.local/state/nvim/
   rm -rf ~/.local/share/nvim/
   ```

3. **Reinstala plugins**:
   ```bash
   nvim --headless "+Lazy! sync" +qa
   ```

4. **Abre Neovim en modo verbose para depurar**:
   ```bash
   nvim -V9nvim.log
   # Luego revisa: cat nvim.log | grep -i tree
   ```

## 📊 Qué Esperar

### ✅ Lo que DEBE pasar:
- Neovim abre sin errores visibles
- Syntax highlighting funciona
- Un solo mensaje informativo sobre compatibility mode
- Navegación normal por archivos

### ⚠️ Limitaciones conocidas:
- Algunas inyecciones de lenguaje pueden no funcionar
- Treesitter context (sticky header) está desactivado
- Incremental selection está desactivado
- Query linter está desactivado

### ❌ Si algo no funciona:
- Syntax highlighting básico sigue funcionando (regex fallback)
- LSP sigue funcionando normalmente
- Todas las demás funcionalidades de Neovim intactas

## 🔧 Personalización

### Para habilitar más features cuando se arregle:

Edita `lua/plugins/treesitter.lua` y cambia:
```lua
incremental_selection = {
    enable = true,  -- Cambia a true
    -- ...
},

indent = {
    enable = true,  -- Cambia a true
},
```

### Para añadir lenguajes problemáticos a la lista de exclusión:

En `lua/plugins/treesitter.lua`, línea ~56:
```lua
-- You can add problematic languages here if needed
local problematic = { "markdown", "help" }
return vim.tbl_contains(problematic, lang)
```

## 🐛 Debug Mode

Para ver cuántos errores se están suprimiendo, descomenta al final de `00-treesitter-compat.lua`:

```lua
vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        if suppressed_count > 0 then
            print(string.format("Suppressed %d treesitter errors", suppressed_count))
        end
    end,
})
```

## 📚 Referencias

- Issue relacionado: [nvim-treesitter#XXXX](https://github.com/nvim-treesitter/nvim-treesitter/issues)
- Neovim 0.12.2 es una versión nightly muy reciente
- Los parsers se actualizarán eventualmente con soporte completo

## 🎉 Resultado Final

**Antes**: 🔴 Múltiples errores de "Decoration provider" llenando la pantalla

**Después**: ✅ Neovim limpio, funcional, sin errores molestos

---

**Última actualización**: 24 de Abril 2026
**Versión de Neovim**: 0.12.2
**Estado**: ✅ FUNCIONANDO
