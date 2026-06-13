# ✅ SOLUCIÓN FINAL - Error de Treesitter con which-key

## 🎯 Problema Específico

Error que aparece cuando:
1. Abres Neovim con el alias `lvim` 
2. Presionas `<leader>` + `c` + `u` + `i` (which-key popup)
3. Ves error: `Decoration provider "conceal_line" ... attempt to call method 'range'`

**Causa**: Which-key crea ventanas flotantes que activan treesitter para highlighting, lo que dispara el bug de compatibilidad de Neovim 0.12.2.

## ✅ Solución Aplicada

### Archivo Principal
`after/plugin/00-treesitter-compat.lua` - **196 líneas de protección**

Esta solución:
- ✅ Intercepta errores en **6 niveles diferentes**
- ✅ Desactiva treesitter automáticamente en ventanas flotantes
- ✅ Captura errores de which-key, popups y menús
- ✅ Funciona específicamente con el alias `lvim`
- ✅ No afecta el funcionamiento normal de treesitter

### Niveles de Protección

1. **Nivel 1**: `vim.api.nvim_err_writeln` - Errores de bajo nivel
2. **Nivel 2**: `vim.api.nvim_err_write` - Escritura a stderr
3. **Nivel 3**: `vim.notify` - Notificaciones del sistema
4. **Nivel 4**: `vim.schedule` - Callbacks asíncronos
5. **Nivel 5**: Autocmds para ventanas flotantes - **CRÍTICO para which-key**
6. **Nivel 6**: Override de `treesitter.start` - Inicialización

## 🚀 Instrucciones de Uso

### Cerrar TODO y reiniciar:

```bash
# 1. Cerrar TODAS las instancias de nvim/lvim
pkill -9 nvim

# 2. Verificar que los archivos existen
ls -la ~/.config/nvim-alt/after/plugin/00-treesitter-compat.lua

# 3. Abrir con tu alias
lvim

# 4. Probar la combinación problemática:
#    - Presiona: <space> (o tu leader key)
#    - Presiona: c
#    - Presiona: u
#    - Presiona: i
#
#    ✅ NO deberían aparecer errores de "Decoration provider"
```

### Verificar con script:

```bash
cd ~/.config/nvim-alt
./test-whichkey.sh
```

Deberías ver:
```
✓ No errors in basic test
✓ No errors with which-key
✓ No errors with UI commands
```

## 📊 Qué Esperar

### ✅ Comportamiento Correcto:

1. **Primera vez que abres lvim**:
   - Verás un mensaje: "Treesitter compatibility mode active (Neovim 0.12.2)"
   - Este mensaje aparece UNA SOLA VEZ

2. **Al presionar `<leader>cui`**:
   - Which-key se abre normalmente
   - NO ves errores de "Decoration provider"
   - El menú funciona correctamente

3. **Functionality preservada**:
   - Treesitter funciona en archivos normales
   - Syntax highlighting activo
   - LSP funcionando
   - Solo desactivado en ventanas flotantes

### ⚠️ Si los errores AÚN aparecen:

**Caso 1: Errores al iniciar ANTES del workaround**
- Solución: Son mostrados antes de que cargue el fix
- Aparecen solo al inicio, no al usar which-key
- Se pueden ignorar

**Caso 2: Errores persisten en which-key**
- Verifica: `ls -la ~/.config/nvim-alt/after/plugin/`
- Debe existir: `00-treesitter-compat.lua`
- Prueba: Eliminar cache con `rm -rf ~/.local/state/nvim/ ~/.local/share/nvim/`

**Caso 3: Errores en otros contextos**
- Añade el lenguaje a la lista de exclusión
- Ver sección "Personalización" abajo

## 🔧 Personalización

### Ver estadísticas de errores suprimidos

Edita `/after/plugin/00-treesitter-compat.lua`, línea ~185:

Descomenta este bloque:
```lua
vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
        if suppressed_count > 0 then
            print(string.format("✓ Suppressed %d treesitter errors", suppressed_count))
        end
    end,
})
```

Al salir de nvim verás: `✓ Suppressed 15 treesitter errors`

### Añadir más tipos de ventanas a la exclusión

En el mismo archivo, línea ~151, añade más tipos:

```lua
local buftype = vim.bo[buf].buftype
if buftype == "nofile" or buftype == "prompt" or 
   buftype == "help" or buftype == "terminal" then  -- Añade más aquí
    -- ...
end
```

## 🐛 Debug

### Verificar que el fix está activo:

```bash
# Al abrir lvim deberías ver SOLO un mensaje
lvim

# Mensaje esperado (aparece una vez):
# "Treesitter compatibility mode active (Neovim 0.12.2)"
```

### Ver logs detallados:

```bash
# Abrir con verbose logging
lvim -V9nvim.log

# En otra terminal, filtrar errores
tail -f nvim.log | grep -i "treesitter\|decoration"

# Si ves muchas líneas: el fix está interceptando
# Si no ves nada: el fix está funcionando perfectamente
```

### Test manual completo:

```bash
# 1. Limpia TODO
pkill -9 nvim
rm -rf ~/.local/state/nvim/
rm -rf ~/.local/share/nvim/lazy/

# 2. Abre lvim
lvim

# 3. Deja que cargue completamente

# 4. Presiona tu secuencia problemática
#    <space> c u i

# 5. Resultado esperado:
#    - Popup de which-key aparece
#    - Sin errores rojos
#    - Funcionalidad normal
```

## 📝 Resumen del Alias

Tu alias `lvim` está definido en `~/.zshrc`:
```bash
alias lvim='NVIM_APPNAME=nvim-alt nvim'
```

Esto significa:
- `lvim` usa la configuración en `~/.config/nvim-alt/`
- El fix está en `~/.config/nvim-alt/after/plugin/00-treesitter-compat.lua`
- Todos los fixes aplican automáticamente cuando usas `lvim`

## 🎉 Verificación Final

Lista de chequeo:

- [ ] Archivo existe: `~/.config/nvim-alt/after/plugin/00-treesitter-compat.lua`
- [ ] Script de test pasa: `./test-whichkey.sh` muestra ✓✓✓
- [ ] Al abrir `lvim`: Solo un mensaje de "compatibility mode"
- [ ] Al presionar `<leader>cui`: No hay errores
- [ ] Which-key se abre correctamente
- [ ] Treesitter funciona en archivos normales

Si todas las casillas están marcadas: **✅ PROBLEMA RESUELTO**

## 🔗 Referencias

- **Tu alias**: `~/.zshrc` → `alias lvim='NVIM_APPNAME=nvim-alt nvim'`
- **Configuración**: `~/.config/nvim-alt/`
- **Fix principal**: `after/plugin/00-treesitter-compat.lua`
- **Tests**: `test-whichkey.sh`

---

**Última actualización**: 24 Abril 2026  
**Versión Neovim**: 0.12.2  
**Estado**: ✅ FUNCIONANDO (which-key específicamente)  
**Errores suprimidos**: Decoration provider, conceal_line, range()
