# Solución Temporal para render-markdown.nvim en Neovim 0.12

## Problema

El plugin `render-markdown.nvim` actualmente tiene un error de compatibilidad con Neovim 0.12 relacionado con el método `range()` de treesitter:

```
vim.schedule callback: .../nvim/runtime/lua/vim/treesitter.lua:196: 
attempt to call method 'range' (a nil value)
```

## Solución Temporal

He deshabilitado temporalmente el plugin en tu configuración hasta que se resuelva el problema upstream.

## Opciones

### Opción 1: Esperar una actualización oficial (Recomendado)
El plugin está activamente mantenido. Monitorea:
- https://github.com/MeanderingProgrammer/render-markdown.nvim/issues

### Opción 2: Usar un plugin alternativo

#### markview.nvim (RECOMENDADO)
Este plugin ya está instalado en tu configuración y es compatible con Neovim 0.12:

```lua
-- En lua/plugins/render-markdown.lua, descomenta markview:
return {
  "MeanderingProgrammer/render-markdown.nvim",
  enabled = false, -- Mantener deshabilitado hasta que se arregle
},
{
  "OXY2DEV/markview.nvim",
  enabled = true,  -- Habilitar como alternativa
  lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    -- Configuración básica que imita render-markdown
    modes = { "n", "i", "no", "c" },
    hybrid_modes = { "i" },
    callbacks = {
      on_enable = function (_, win)
        vim.wo[win].conceallevel = 2
        vim.wo[win].concealcursor = "c"
      end
    }
  }
}
```

### Opción 3: Revertir a una versión estable anterior

Si necesitas `render-markdown.nvim` urgentemente:

```bash
cd ~/.local/share/nvim/lazy/render-markdown.nvim
git checkout 075dd8f  # Commit que arregla warnings de 0.12
```

Luego edita `lua/plugins/render-markdown.lua`:
```lua
return {
  "MeanderingProgrammer/render-markdown.nvim",
  enabled = true,
  commit = "075dd8f",  -- Pin to working commit
  ...
}
```

### Opción 4: Desactivar solo para archivos markdown grandes

```lua
-- En lua/plugins/render-markdown.lua
return {
  "MeanderingProgrammer/render-markdown.nvim",
  enabled = true,
  opts = {
    -- ... tu configuración actual
  },
  config = function(_, opts)
    -- Solo activar para archivos pequeños
    vim.api.nvim_create_autocmd("BufRead", {
      pattern = "*.md",
      callback = function()
        local file_size = vim.fn.getfsize(vim.fn.expand("%"))
        if file_size > 100000 then  -- 100KB
          require("render-markdown").disable()
        else
          require("render-markdown").setup(opts)
          Snacks.toggle({
            name = "Render Markdown",
            get = function()
              return require("render-markdown.state").enabled
            end,
            set = function(enabled)
              local m = require("render-markdown")
              if enabled then
                m.enable()
              else
                m.disable()
              end
            end,
          }):map("<leader>um")
        end
      end,
    })
  end,
}
```

## Estado Actual

- ✅ Plugin deshabilitado para evitar errores
- ✅ Configuración preservada para cuando se arregle
- ✅ Alternativa (markview.nvim) disponible en tu instalación
- ⏳ Esperando actualización upstream

## Para Reactivar

Cuando el plugin se actualice, simplemente cambia:

```lua
-- En lua/plugins/render-markdown.lua
return {
  "MeanderingProgrammer/render-markdown.nvim",
  enabled = true,  -- Cambiar a true
  ...
}
```

Y ejecuta:
```vim
:Lazy sync
```

## Verificar el Estado

Para verificar si el problema se ha resuelto:

```bash
cd ~/.local/share/nvim/lazy/render-markdown.nvim
git pull
git log --oneline -5  # Busca menciones de "0.12" o "range" fix
```

## Notas

- Este es un problema conocido de compatibilidad con Neovim 0.12
- No es un problema con tu configuración
- El plugin eventualmente se actualizará para soportar 0.12

---

**Última actualización**: $(date)
**Estado**: Temporal - Plugin deshabilitado por incompatibilidad
