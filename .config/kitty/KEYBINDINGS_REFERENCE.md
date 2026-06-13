# Kitty - Referencia Completa de Atajos de Teclado

Esta es una guía completa de todos los atajos de teclado configurados en Kitty con estilo tmux.

---

## 📑 Índice

1. [Prefix Key](#prefix-key)
2. [Splits / Paneles (Windows)](#splits--paneles-windows)
3. [Navegación entre Paneles](#navegación-entre-paneles)
4. [Redimensionar Paneles](#redimensionar-paneles)
5. [Gestión de Paneles](#gestión-de-paneles)
6. [Tabs (Pestañas)](#tabs-pestañas)
7. [Sesiones](#sesiones)
8. [Layouts](#layouts)
9. [Scrollback / Historial](#scrollback--historial)
10. [Terminal Operations](#terminal-operations)
11. [Quick Access Terminals](#quick-access-terminals-ventanas-flotantes)
12. [Configuración](#configuración)
13. [Atajos Adicionales](#atajos-adicionales)

---

## Prefix Key

**Prefix principal**: `Ctrl+a` (igual que tmux)

Al ver `Ctrl+a>x` significa: presiona `Ctrl+a`, suelta, luego presiona `x`

---

## Splits / Paneles (Windows)

En Kitty, los "windows" son equivalentes a los "panes" en tmux (divisiones de pantalla).

| Atajo | Acción | Descripción |
|-------|--------|-------------|
| `Ctrl+a` + `v` | Split vertical | Crea panel a la derecha (como tmux) |
| `Ctrl+a` + `d` | Split horizontal | Crea panel abajo (como tmux) |
| `Ctrl+a` + `s` | Split vertical (alt) | Alternativa para split vertical |
| `cmd+enter` | Nuevo panel | Crea panel según layout actual |

---

## Navegación entre Paneles

| Atajo | Acción | Notas |
|-------|--------|-------|
| `Ctrl+a` + `h` | Ir a panel izquierdo | Con prefix |
| `Ctrl+a` + `j` | Ir a panel abajo | Con prefix |
| `Ctrl+a` + `k` | Ir a panel arriba | Con prefix |
| `Ctrl+a` + `l` | Ir a panel derecho | Con prefix |
| `Ctrl+h` | Ir a panel izquierdo | Directo (sin prefix) |
| `Ctrl+j` | Ir a panel abajo | Directo (sin prefix) |
| `Ctrl+k` | Ir a panel arriba | Directo (sin prefix) |
| `ctrl+shift+h` | Panel anterior | Navegación secuencial |
| `ctrl+shift+l` | Panel siguiente | Navegación secuencial |

**Nota**: `Ctrl+h/j/k` funcionan sin prefix. `Ctrl+l` ahora limpia la terminal, usa `Ctrl+a` + `l` para ir a la derecha.

---

## Redimensionar Paneles

### Con prefix (estilo tmux)

| Atajo | Acción | Incremento |
|-------|--------|------------|
| `Ctrl+a` + `Shift+H` | Más estrecho | 5 unidades |
| `Ctrl+a` + `Shift+J` | Más corto | 5 unidades |
| `Ctrl+a` + `Shift+K` | Más alto | 5 unidades |
| `Ctrl+a` + `Shift+L` | Más ancho | 5 unidades |

### Sin prefix (alternativo)

| Atajo | Acción |
|-------|--------|
| `ctrl+cmd+option+h` | Más estrecho |
| `ctrl+cmd+option+j` | Más corto |
| `ctrl+cmd+option+k` | Más alto |
| `ctrl+cmd+option+l` | Más ancho |

---

## Gestión de Paneles

| Atajo | Acción | Descripción |
|-------|--------|-------------|
| `Ctrl+a` + `x` | Cerrar panel | Como tmux kill-pane |
| `Ctrl+a` + `z` | Zoom/Maximize | Toggle panel en pantalla completa |
| `Ctrl+a` + `Space` | Siguiente layout | Rota entre layouts disponibles |
| `kitty_mod+w` | Cerrar panel | Alternativo (`kitty_mod` = `cmd+option`) |
| `ctrl+cmd+h` | Swap panel | Intercambia con otro panel |

---

## Tabs (Pestañas)

En Kitty, los "tabs" son equivalentes a las "windows" en tmux.

### Crear y Cerrar

| Atajo | Acción | Descripción |
|-------|--------|-------------|
| `Ctrl+a` + `c` | Nueva tab | Como tmux prefix+c |
| `Ctrl+a` + `Shift+7` | Cerrar tab (conf.) | Con confirmación (como tmux &) |
| `Ctrl+a` + `q` | Cerrar tab | Sin confirmación |
| `cmd+t` | Nueva tab | Atajo directo macOS |

### Navegación

| Atajo | Acción | Descripción |
|-------|--------|-------------|
| `Ctrl+a` + `n` | Siguiente tab | Como tmux prefix+n |
| `Ctrl+a` + `Shift+,` | Tab anterior | Equivale a prefix+p en tmux |
| `Ctrl+a` + `1` | Ir a tab 1 | |
| `Ctrl+a` + `2` | Ir a tab 2 | |
| `Ctrl+a` + `3` | Ir a tab 3 | |
| `Ctrl+a` + `4` | Ir a tab 4 | |
| `Ctrl+a` + `5` | Ir a tab 5 | |
| `Ctrl+a` + `6` | Ir a tab 6 | |
| `Ctrl+a` + `7` | Ir a tab 7 | |
| `Ctrl+a` + `8` | Ir a tab 8 | |
| `Ctrl+a` + `9` | Ir a tab 9 | |

### Gestión

| Atajo | Acción | Descripción |
|-------|--------|-------------|
| `Ctrl+a` + `,` | Renombrar tab | Como tmux prefix+, |
| `Ctrl+a` + `<` | Mover tab izquierda | `Shift+,` |
| `Ctrl+a` + `>` | Mover tab derecha | `Shift+.` |

---

## Sesiones

Las sesiones en Kitty son como workspaces/proyectos (similar a tmux sessions).

### Sesiones Específicas (con mayúsculas)

| Atajo | Sesión | Path |
|-------|--------|------|
| `Ctrl+a` + `Shift+D` | Dotfiles | ~/github/dotfiles-latest/kitty/sessions/dotfiles.kitty-session |
| `Ctrl+a` + `Shift+O` | Obsidian | ~/github/dotfiles-latest/kitty/sessions/obsidian.kitty-session |
| `Ctrl+a` + `Shift+N` | Networking | ~/github/dotfiles-latest/kitty/sessions/networking.kitty-session |
| `Ctrl+a` + `Shift+H` | Home | ~/github/dotfiles-latest/kitty/sessions/home.kitty-session |
| `Ctrl+a` + `Shift+B` | Blogpost | ~/github/dotfiles-latest/kitty/sessions/blogpost.kitty-session |
| `Ctrl+a` + `Shift+P` | Dots-private | ~/github/dotfiles-latest/kitty/sessions/dots-private.kitty-session |
| `Ctrl+a` + `Shift+A` | Lua | ~/github/dotfiles-latest/kitty/sessions/lua.kitty-session |
| `Ctrl+a` + `Shift+K` | Skitty | ~/github/dotfiles-latest/kitty/sessions/skitty.kitty-session |
| `Ctrl+a` + `;` | Scripts | ~/github/dotfiles-latest/kitty/sessions/scripts.kitty-session |
| `Ctrl+a` + `Shift+G` | Glove80 | ~/github/dotfiles-latest/kitty/sessions/glove80.kitty-session |
| `Ctrl+a` + `Shift+W` | Work | ~/github/dotfiles-private/work/2026/work.kitty-session |

### Navegación de Sesiones

| Atajo | Acción | Descripción |
|-------|--------|-------------|
| `Ctrl+a` + `Shift+L` | Sesión anterior | Alterna entre última sesión (como tmux prefix+l) |
| `Ctrl+a` + `Shift+S` | Lista de sesiones | Selector interactivo |
| `Ctrl+a` + `f` | Selector fzf | Selector visual con fzf |
| `Ctrl+a` + `i` | Daily note | Lanza script de nota diaria |

### Guardar Sesión

| Atajo | Acción | Descripción |
|-------|--------|-------------|
| `Ctrl+a` + `Shift+Shift+S` | Guardar sesión | Abre editor para guardar sesión actual |

### LEGACY (ctrl+b - para transición gradual)

Todos los atajos de sesiones también funcionan con `ctrl+b` en lugar de `ctrl+a`. Se recomienda usar `ctrl+a` y eventualmente eliminar estos.

---

## Layouts

| Atajo | Acción | Layout |
|-------|--------|--------|
| `Ctrl+a` + `Space` | Siguiente layout | Rota entre layouts |
| `ctrl+cmd+option+u` | Layout tall | Vertical stack |
| `ctrl+cmd+option+i` | Layout fat | Horizontal stack |
| `ctrl+cmd+option+o` | Layout stack | Un panel visible (como zoom) |

---

## Scrollback / Historial

| Atajo | Acción | Descripción |
|-------|--------|-------------|
| `kitty_mod+i` | Ver scrollback | Abre historial en nvim (overlay) |

**Nota**: `kitty_mod` = `cmd+option`

Dentro del scrollback en nvim:
- `q` → cerrar
- Navegación vim normal (j/k, /, etc.)

---

## Terminal Operations

| Atajo | Acción | Descripción |
|-------|--------|-------------|
| `Ctrl+l` | Limpiar terminal | Envía clear (estilo bash/tmux) |
| `cmd+k` | Limpiar terminal | Alternativa macOS |

---

## Quick Access Terminals (Ventanas Flotantes)

Estos atajos abren terminales flotantes temporales (overlays).

| Atajo | Acción | Descripción |
|-------|--------|-------------|
| `kitty_mod+a>d` | Quick access | Terminal flotante por defecto |
| `kitty_mod+a>t` | System task | Script de tareas del sistema |
| `kitty_mod+a>c` | Colorscheme | Selector de esquemas de color |
| `kitty_mod+a>n` | Daily note (float) | Nota diaria en ventana flotante |
| `kitty_mod+a>s` | Skitty notes | Notas de skitty en nvim |

**Nota**: `kitty_mod` = `cmd+option`

---

## Configuración

| Atajo | Acción | Descripción |
|-------|--------|-------------|
| `Ctrl+a` + `r` | Recargar config | Como tmux source-file (prefix+r) |
| `ctrl+cmd+,` | Recargar config | Alternativa macOS |

---

## Atajos Adicionales

### Clipboard

| Atajo | Acción |
|-------|--------|
| `cmd+c` | Copiar (macOS default) |
| `cmd+v` | Pegar (macOS default) |

### Ventanas macOS

| Atajo | Acción |
|-------|--------|
| `kitty_mod+f11` | Toggle fullscreen |
| `kitty_mod+f10` | Toggle maximized |

### Opciones macOS

**Nota**: `macos_option_as_alt` está configurado como `right` - la tecla Option derecha funciona como Alt en programas de terminal.

---

## Resumen Visual: Jerarquía

```
┌─ Session (Proyecto/Workspace) ─────────────────────┐
│                                                      │
│  ┌─ Tab 1 ────────────────────────────────────┐    │
│  │                                             │    │
│  │  ┌─ Window/Pane 1 ─┐  ┌─ Window/Pane 2 ─┐ │    │
│  │  │                  │  │                  │ │    │
│  │  │   $ nvim         │  │   $ npm run dev  │ │    │
│  │  │                  │  │                  │ │    │
│  │  └──────────────────┘  └──────────────────┘ │    │
│  │  ┌─ Window/Pane 3 ─────────────────────────┐│    │
│  │  │   $ git status                           ││    │
│  │  └──────────────────────────────────────────┘│    │
│  └─────────────────────────────────────────────┘    │
│                                                      │
│  ┌─ Tab 2 ────────────────────────────────────┐    │
│  │  ┌─ Window/Pane 1 ─────────────────────────┐│    │
│  │  │   $ ...                                  ││    │
│  │  └──────────────────────────────────────────┘│    │
│  └─────────────────────────────────────────────┘    │
│                                                      │
└──────────────────────────────────────────────────────┘
```

**Orden de jerarquía**:
1. **Session** → workspace/proyecto completo
2. **Tab** → contexto dentro del proyecto (≈ tmux window)
3. **Window/Pane** → divisiones de pantalla (≈ tmux pane)

---

## Flujo de Trabajo Recomendado

### Ejemplo: Trabajar en un proyecto web

1. **Cambiar a sesión**: `Ctrl+a` + `Shift+D` (dotfiles)
2. **Crear tabs para contextos diferentes**:
   - Tab 1: Editor → `Ctrl+a` + `c`, renombrar → `Ctrl+a` + `,` → "editor"
   - Tab 2: Servidor → `Ctrl+a` + `c`, renombrar → "server"
   - Tab 3: Tests → `Ctrl+a` + `c`, renombrar → "tests"
3. **Dentro de cada tab, crear splits**:
   - En tab "editor": `Ctrl+a` + `v` → nvim izquierda, terminal derecha
   - En tab "server": `Ctrl+a` + `d` → npm run dev arriba, logs abajo
4. **Navegar**:
   - Entre tabs: `Ctrl+a` + `1/2/3` o `Ctrl+a` + `n`
   - Entre panels: `Ctrl+h/j/k` o `Ctrl+a` + `h/j/k/l`
5. **Zoom temporal**: `Ctrl+a` + `z` para focus
6. **Limpiar terminal**: `Ctrl+l`

---

## Diferencias con tmux

| Característica | tmux | Kitty |
|----------------|------|-------|
| Prefix | `Ctrl+a` | `Ctrl+a` ✅ |
| Split horizontal | `Ctrl+a` + `"` o `d` | `Ctrl+a` + `d` ✅ |
| Split vertical | `Ctrl+a` + `%` o `v` | `Ctrl+a` + `v` ✅ |
| Windows | Equivale a tabs | Equivale a panels |
| Tabs | No tiene | Sí tiene |
| Detach | `Ctrl+a` + `d` | No existe (usa sesiones) |
| Copy mode | `Ctrl+a` + `[` | `kitty_mod+i` (abre en nvim) |
| Clear screen | `Ctrl+l` | `Ctrl+l` ✅ |

---

## Tips de Productividad

1. **Usa `Ctrl+a` + `z`** para focus temporal en un panel (como zoom en tmux)
2. **Navega rápido** con números: `Ctrl+a` + `1/2/3` para tabs
3. **Renombra tus tabs** con `Ctrl+a` + `,` para mejor contexto
4. **Aprovecha los splits** para tener múltiples shells visibles
5. **Las sesiones son proyectos** - crea una para cada workspace
6. **`Ctrl+l` es tu amigo** - limpia la terminal rápidamente
7. **Quick access terminals** (`kitty_mod+a>...`) son perfectos para tareas rápidas
8. **Navegación sin prefix** con `Ctrl+h/j/k` es más rápida (excepto `l` que limpia)

---

## Troubleshooting

### "Los atajos no funcionan"
- Recarga la config: `Ctrl+a` + `r`
- O reinicia Kitty completamente

### "Ctrl+l navega en lugar de limpiar"
- Esto es correcto ahora. Usa `Ctrl+a` + `l` para navegar a la derecha

### "Quiero volver a los atajos antiguos"
- Todos los backups están en `~/.config/kitty/kitty.conf.backup-*`
- Restaura con: `cp kitty.conf.backup-TIMESTAMP kitty.conf`

---

## Referencias

- **Configuración principal**: `~/.config/kitty/kitty.conf`
- **Mapeo tmux→kitty**: `~/.config/kitty/TMUX_TO_KITTY_MAPPINGS.md`
- **Este archivo**: `~/.config/kitty/KEYBINDINGS_REFERENCE.md`
- **Documentación Kitty**: https://sw.kovidgoyal.net/kitty/

---

**Última actualización**: $(date)
**Versión**: 1.0 - Configuración completa estilo tmux
