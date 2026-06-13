# Neovim 0.12.2 Treesitter Compatibility Fix

## Problema
Neovim 0.12.2 (versión nightly/development) tiene problemas de compatibilidad con nvim-treesitter que causan errores como:

```
Decoration provider "start" (ns=nvim.treesitter.highlighter):
Lua: attempt to call method 'range' (a nil value)
```

## Soluciones Aplicadas

### 1. Actualización de plugins
- Actualizado nvim-treesitter a la última versión del master branch
- Sincronizado todos los plugins con Lazy.nvim

### 2. Configuración modificada

#### `lua/plugins/treesitter.lua`
- **Desactivado `query_linter`**: Causaba problemas con la nueva API
- **Simplificado build command**: Cambio a `:TSUpdate` en lugar de función Lua
- **Mejorado manejo de errores**: Añadida función de disable más robusta

#### `after/plugin/treesitter-compat.lua` (NUEVO)
- **Supresión de errores**: Captura y suprime errores de decoration provider
- **Manejo de errores en highlighter**: Wrapping de funciones problemáticas
- **Validación de parsers**: Verificación segura de parsers en cada buffer
- **Notificación única**: Muestra un mensaje informativo una sola vez

### 3. Script de testing
- Creado `test-config.sh` para verificar la configuración
- Tests de startup, apertura de archivos y estado de treesitter

## Limitaciones Conocidas

⚠️ **Advertencia**: Neovim 0.12.2 es una versión development muy reciente. Algunas funciones avanzadas de treesitter pueden no funcionar completamente:

1. **Language injections**: Algunas inyecciones de lenguaje pueden fallar silenciosamente
2. **Query linter**: Desactivado debido a incompatibilidades
3. **Algunos parsers**: Parsers más nuevos pueden tener problemas ocasionales

## Recomendaciones

### Opción 1: Mantener configuración actual (ELEGIDA)
- Los errores están suprimidos y la mayoría de funcionalidades funcionan
- Treesitter sigue activo con highlight syntax
- Se mostrarán actualizaciones automáticamente cuando haya fixes

### Opción 2: Degradar a versión estable
Si experimentas más problemas, puedes degradar a Neovim 0.10.x:
```bash
brew uninstall neovim
brew install neovim@0.10
```

### Opción 3: Desactivar treesitter temporalmente
Comenta o elimina la configuración de treesitter en `lua/plugins/treesitter.lua`

## Verificación

Para verificar que todo funciona correctamente:

```bash
cd ~/.config/nvim-alt
./test-config.sh
```

Deberías ver:
```
✓ Basic startup successful
✓ No decoration errors detected
✓ Treesitter commands available
```

## Mantenimiento Futuro

Cuando nvim-treesitter se actualice con soporte completo para Neovim 0.12.2:

1. Actualizar plugins: `:Lazy! sync`
2. Actualizar parsers: `:TSUpdate`
3. Opcionalmente, puedes eliminar `after/plugin/treesitter-compat.lua`
4. Re-activar `query_linter` en la configuración

## Changelog

**2026-04-24**: Aplicado fix de compatibilidad para Neovim 0.12.2
- Suprimidos errores de decoration provider
- Añadido manejo robusto de errores
- Creado script de testing
- Documentado soluciones y limitaciones

---

**Nota**: Este fix es temporal hasta que nvim-treesitter y Neovim 0.12.2 tengan mejor compatibilidad. Monitorea los issues en:
- https://github.com/nvim-treesitter/nvim-treesitter/issues
- https://github.com/neovim/neovim/issues
