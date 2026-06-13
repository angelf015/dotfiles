# Actualizaciones para Neovim 0.12

Este archivo documenta las actualizaciones realizadas y características adicionales que puedes aprovechar.

## Cambios Realizados

### 1. **plugin/lsp.lua**
- Actualizado el manejo de inlay hints para usar la API mejorada de 0.12
- Añadidos comentarios sobre la configuración de signos de diagnóstico
- La configuración de signos ahora es parte de `vim.diagnostic.config()` (deprecado el uso de `:sign-define`)

### 2. **lua/plugins/treesitter.lua**
- Cambiado `vim.loop.fs_stat` a `vim.uv.fs_stat` (vim.loop está deprecado)
- `vim.uv` es el nuevo alias recomendado para libuv en Neovim 0.12

### 3. **plugin/options.lua**
- Añadida opción `opt.pummaxwidth = 50` (nueva en 0.12) - controla el ancho máximo del menú popup
- Añadida opción `opt.maxsearchcount = 999` (nueva en 0.12) - valor máximo para searchcount()

### 4. **plugin/keymaps.lua**
- Añadido keymap `grt` para `vim.lsp.buf.type_definition()` (nuevo por defecto en 0.12)
- Añadido keymap `grx` para `vim.lsp.codelens.run()` (nuevo por defecto en 0.12)
- Actualizado comentario sobre snippets nativos para reflejar mejoras en 0.12

## Nuevas Características de Neovim 0.12 que Puedes Aprovechar

### LSP Mejoras

#### 1. **Inline Completions**
Neovim 0.12 ahora soporta `textDocument/inlineCompletion`. Para usarlo:

```lua
-- En tu configuración de LSP
vim.lsp.completion.enable(true, client_id, bufnr, {
  autotrigger = true,
  convert = function(item)
    -- Personaliza la conversión de items
    return item
  end
})
```

#### 2. **LSP Code Lens Mejorado**
El sistema de code lens fue reimplementado. Tu configuración ya está lista para usarlo con `grx`.

#### 3. **Diagnostic Related Information**
Ahora puedes usar `gf` en ventanas flotantes de diagnósticos para saltar a información relacionada.

#### 4. **Nuevo comando `:lsp`**
Puedes usar `:lsp` para gestionar clientes LSP interactivamente:
```vim
:lsp                    " Lista todos los clientes
:lsp stop <name>        " Detiene un cliente específico
:lsp restart <name>     " Reinicia un cliente
```

### Nuevas Opciones

#### 1. **'pumborder'**
Añade bordes al menú popup:
```lua
vim.opt.pumborder = 'rounded'  -- También: 'single', 'double', 'bold'
```

#### 2. **'diffanchors'**
Especifica direcciones para anclar un diff (mejora la precisión del diff).

#### 3. **'autocomplete'**
Habilita autocompletado automático (ins-autocompletion):
```lua
vim.opt.autocomplete = true
```

#### 4. **'busy'**
Establece el estado "ocupado" de un buffer. Ya se muestra en tu statusline por defecto con el símbolo ◐.

### Nuevos Comandos

#### 1. **`:uniq`**
Elimina líneas duplicadas en el buffer actual:
```vim
:%uniq              " Elimina duplicados en todo el buffer
:'<,'>uniq          " Elimina duplicados en la selección visual
```

#### 2. **`:iput`**
Como `:put` pero ajusta la indentación automáticamente:
```vim
:iput +             " Pega desde el registro + con indentación
```

#### 3. **`:retab -indentonly`**
Solo cambia los espacios en blanco al inicio de las líneas indentadas:
```vim
:%retab! -indentonly
```

#### 4. **`:DiffTool`**
Compara directorios y archivos (plugin nativo):
```vim
:DiffTool dir1/ dir2/
```

#### 5. **`:Undotree`**
Navegador visual del árbol de deshacer:
```vim
:Undotree
```

### Mejoras en Treesitter

#### 1. **Selección Incremental Mejorada**
Ya configurado en tu `treesitter.lua`:
- `<c-space>` - Expande selección
- `<c-backspace>` - Reduce selección

#### 2. **Nuevos movimientos de selección**
Si usas LSP `textDocument/selectionRange`:
- `v_an` - Selecciona hacia afuera
- `v_in` - Selecciona hacia adentro

### Mejoras en Diagnósticos

Tu `vim.diagnostic.config()` ya está actualizado, pero considera:

```lua
-- Filtrar diagnósticos antes de mostrarlos
vim.diagnostic.setqflist({
  format = function(diagnostic)
    -- Filtrar o modificar diagnósticos
    if diagnostic.severity == vim.diagnostic.severity.HINT then
      return nil  -- Omitir hints
    end
    return diagnostic
  end
})

-- Obtener solo diagnósticos habilitados
local diags = vim.diagnostic.get(0, { enabled = true })

-- Ver estado de diagnósticos (útil para statusline)
vim.diagnostic.status()
```

### Nuevas APIs de Lua

#### 1. **vim.net.request()**
Hacer peticiones HTTP directamente desde Lua:
```lua
local response = vim.net.request({
  url = "https://api.github.com/users/neovim",
  method = "GET",
  headers = { ["User-Agent"] = "Neovim" }
})

print(vim.json.decode(response.body).name)
```

#### 2. **vim.list.unique()**
Eliminar duplicados de listas:
```lua
local list = {1, 2, 2, 3, 3, 3, 4}
local unique = vim.list.unique(list)  -- {1, 2, 3, 4}
```

#### 3. **vim.json.encode() con pretty-print**
```lua
local json = vim.json.encode(data, {
  indent = 2,          -- Pretty-print con indentación
  sort_keys = true     -- Ordenar claves
})
```

#### 4. **vim.json.decode() con comentarios**
```lua
local data = vim.json.decode(json_string, {
  skip_comments = true  -- Permitir comentarios en JSON
})
```

#### 5. **vim.fs.ext()**
Obtener la extensión de un archivo:
```lua
local ext = vim.fs.ext("archivo.lua")  -- ".lua"
```

### Mejoras en UI

#### 1. **Statusline mejorado**
El statusline por defecto ahora muestra:
- `vim.diagnostic.status()` - Estado de diagnósticos
- `vim.ui.progress_status()` - Mensajes de progreso
- Código de salida de :terminal
- Estado 'busy' (◐)

Ya tienes `snacks.statuscolumn` configurado, que aprovecha estas mejoras.

#### 2. **Floating windows con statusline**
Los floating windows ahora pueden mostrar statusline:
```lua
vim.api.nvim_open_win(buf, true, {
  relative = 'editor',
  width = 50,
  height = 10,
  row = 5,
  col = 5,
  style = 'minimal'  -- Usa esto para ocultar el statusline
})
```

#### 3. **Barras de progreso nativas**
Los eventos `Progress` ahora muestran barras de progreso nativas en el TUI usando OSC 9;4.

### Mejoras de Seguridad

#### 1. **:trust mejorado**
Ya no muestra "(a)llow". Debes "(v)iew" y luego ejecutar `:trust`:
```vim
:trust              " Confiar en el archivo actual
:trust path/to/file " Confiar en un archivo específico
```

#### 2. **Windows: Sin búsqueda en directorio actual**
En Windows, Neovim ya no busca ejecutables en el directorio actual por seguridad.

### Mejoras de Rendimiento

#### 1. **LSP tokens por viewport**
LSP ahora puede solicitar tokens semánticos solo para el viewport visible (pantalla), mejorando el rendimiento.

#### 2. **:packadd más rápido**
`:packadd` ya no invalida el cache del path de Lua, actualizándolo en su lugar. Esto puede hacer una gran diferencia en el tiempo de inicio.

#### 3. **vim.glob.to_lpeg() más rápido**
La nueva implementación basada en LPeg (Peglob) proporciona ~50% de mejora de velocidad para patrones complejos.

## Características Experimentales (Úsalas con cuidado)

### 1. **vim.pos y vim.range**
Nuevas abstracciones para Position/Range:
```lua
local pos = vim.pos(5, 10)  -- línea 5, columna 10
local range = vim.range(1, 0, 10, 0)  -- líneas 1-10
```

### 2. **ui2**
Rediseño del core de mensajes y commandline UI:
```lua
-- Para habilitarlo (experimental):
require('vim._core.ui2').enable()
```

Beneficios:
- Evita interrupciones de "Press ENTER"
- Resalta la línea de comandos mientras escribes
- Proporciona el pager como buffer + ventana

### 3. **nvim__exec_lua_fast()**
Permite a clientes API remotos ejecutar Lua mientras Nvim está bloqueado esperando entrada.

## Cambios que Debes Conocer (Breaking Changes)

### 1. **i_CTRL-R con registros nombrados**
`<C-R>` ahora inserta registros nombrados literalmente (como pegar) en lugar de como entrada de usuario.
Para el comportamiento antiguo: `<C-R>=@x`

### 2. **JSON "null"**
En mensajes LSP, los valores "null" de JSON ahora se representan como `vim.NIL` en lugar de `nil`.

### 3. **vim.diff renombrado**
`vim.diff` ahora es `vim.text.diff`.

### 4. **'shelltemp' por defecto false**
`'shelltemp'` ahora es `false` por defecto. Los comandos de shell ahora usan `pipe()` en lugar de `socketpair()`.

## Recomendaciones

1. **Prueba el nuevo `:lsp` command** para gestionar tus servidores LSP
2. **Habilita pumborder** para bordes en el menú de completado:
   ```lua
   vim.opt.pumborder = 'rounded'
   ```
3. **Prueba `:Undotree`** para navegar visualmente el historial de deshacer
4. **Considera usar `vim.net.request()`** en tus plugins en lugar de `curl` o similares
5. **Usa `:DiffTool`** para comparar directorios (muy útil)

## Plugins que Podrías Actualizar

Algunos de tus plugins podrían tener actualizaciones específicas para 0.12:
- **blink.cmp**: Verifica si hay actualizaciones que aprovechen las nuevas APIs de completado
- **telescope**: Puede beneficiarse de las mejoras de rendimiento en glob
- **nvim-lspconfig**: Asegúrate de usar la última versión compatible con 0.12

## Recursos Adicionales

- [News 0.12](https://neovim.io/doc/user/news-0.12.html) - Documentación oficial completa
- [Breaking Changes](https://neovim.io/doc/user/deprecated.html#deprecated-0.12) - Cambios que rompen compatibilidad
- `:help news-0.12` - Ayuda integrada en Neovim

---

**Nota**: Todos los cambios principales ya están aplicados en tu configuración. Este documento te ayuda a descubrir características adicionales que puedes aprovechar.
