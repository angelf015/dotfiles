# Mapeo de atajos: tmux → Kitty

Esta guía te ayudará a adaptarte a los nuevos atajos de Kitty que replican tu flujo de trabajo en tmux.

## Prefix
- **tmux**: `Ctrl+a`
- **Kitty**: `Ctrl+a` (idéntico)

## Splits / Ventanas (Panes)

| Acción | tmux | Kitty |
|--------|------|-------|
| Split horizontal (derecha) | `Ctrl+a` + `v` | `Ctrl+a` + `v` |
| Split vertical (abajo) | `Ctrl+a` + `d` | `Ctrl+a` + `d` |
| Alternativa horizontal | `Ctrl+a` + `%` | `Ctrl+a` + `s` |

## Navegación

| Acción | tmux | Kitty |
|--------|------|-------|
| Ir a panel izquierdo | `Ctrl+a` + `h` | `Ctrl+a` + `h` o `Ctrl+h` |
| Ir a panel abajo | `Ctrl+a` + `j` | `Ctrl+a` + `j` o `Ctrl+j` |
| Ir a panel arriba | `Ctrl+a` + `k` | `Ctrl+a` + `k` o `Ctrl+k` |
| Ir a panel derecho | `Ctrl+a` + `l` | `Ctrl+a` + `l` o `Ctrl+l` |

**Nota**: En Kitty puedes navegar sin prefix usando solo `Ctrl+h/j/k/l` (integración con nvim).

## Redimensionar (Resize)

| Acción | tmux | Kitty |
|--------|------|-------|
| Más estrecho | `Ctrl+a` + `Shift+H` | `Ctrl+a` + `Shift+H` |
| Más corto | `Ctrl+a` + `Shift+J` | `Ctrl+a` + `Shift+J` |
| Más alto | `Ctrl+a` + `Shift+K` | `Ctrl+a` + `Shift+K` |
| Más ancho | `Ctrl+a` + `Shift+L` | `Ctrl+a` + `Shift+L` |

## Gestión de ventanas (panes)

| Acción | tmux | Kitty |
|--------|------|-------|
| Cerrar panel | `Ctrl+a` + `x` | `Ctrl+a` + `x` |
| Zoom/Maximize | `Ctrl+a` + `z` | `Ctrl+a` + `z` |
| Cambiar layout | - | `Ctrl+a` + `Space` |
| Recargar config | `Ctrl+a` + `r` | `Ctrl+a` + `r` |

## Tabs (equivalente a tmux windows)

En tmux, las "windows" son equivalentes a los "tabs" en Kitty. Ahora puedes manejarlos igual:

| Acción | tmux | Kitty |
|--------|------|-------|
| Crear nueva tab | `Ctrl+a` + `c` | `Ctrl+a` + `c` |
| Siguiente tab | `Ctrl+a` + `n` | `Ctrl+a` + `n` |
| Tab anterior | `Ctrl+a` + `p` | `Ctrl+a` + `Shift+,` |
| Cerrar tab (con confirmación) | `Ctrl+a` + `&` | `Ctrl+a` + `Shift+7` |
| Cerrar tab (sin confirmación) | - | `Ctrl+a` + `q` |
| Renombrar tab | `Ctrl+a` + `,` | `Ctrl+a` + `,` |
| Ir a tab 1-9 | `Ctrl+a` + `1-9` | `Ctrl+a` + `1-9` |
| Mover tab a la izquierda | - | `Ctrl+a` + `Shift+,` (`<`) |
| Mover tab a la derecha | - | `Ctrl+a` + `Shift+.` (`>`) |

**Nota**: `Ctrl+a` + `Shift+,` está mapeado a "tab anterior" porque `p` minúscula conflictúa con la sesión dots-private.

## Sesiones (similar a tmux sessions)

| Acción | tmux | Kitty |
|--------|------|-------|
| Ir a sesión anterior | `Ctrl+a` + `l` | `Ctrl+a` + `Shift+L` |
| Selector de sesiones | - | `Ctrl+a` + `Shift+S` |
| Selector visual (fzf) | - | `Ctrl+a` + `f` |
| Guardar sesión | tmux-resurrect | `Ctrl+a` + `Shift+Shift+S` |

### Atajos específicos de sesiones:

Todos los atajos de sesiones usan **mayúsculas** con `Ctrl+a`:

- `Ctrl+a` + `Shift+D` → dotfiles session
- `Ctrl+a` + `Shift+O` → obsidian session
- `Ctrl+a` + `Shift+N` → networking session
- `Ctrl+a` + `Shift+H` → home session
- `Ctrl+a` + `Shift+B` → blogpost session
- `Ctrl+a` + `Shift+K` → skitty session
- `Ctrl+a` + `Shift+W` → work session
- `Ctrl+a` + `;` → scripts session

## Transición gradual

Los atajos con `Ctrl+b` siguen funcionando temporalmente para sesiones. Una vez que te acostumbres a `Ctrl+a`, puedes eliminar las líneas marcadas como "LEGACY" en `kitty.conf`.

## Diferencias clave

1. **Sin detach**: Kitty no tiene concepto de "detach" como tmux. Las sesiones son más como "workspaces".
2. **Integración con nvim**: Los atajos `Ctrl+h/j/k/l` funcionan tanto dentro como fuera de nvim gracias a `vim-kitty-navigator`.
3. **Layouts**: Kitty tiene menos layouts que tmux, pero `stack` funciona como zoom.
4. **Tabs vs Windows**: En Kitty, "windows" son los splits/panes, y "tabs" son las ventanas superiores (equivalente a tmux windows).

## Atajos adicionales útiles

- `cmd+t`: crear nueva tab rápido (sin prefix)
- `cmd+enter`: crear nueva ventana/split rápido (sin prefix)
- `ctrl+cmd+option+h/j/k/l`: resize alternativo sin prefix
- `kitty_mod+a>d/t/c/n/s`: quick-access terminals (floating windows)

## Referencia rápida: Jerarquía en Kitty

```
Session (proyecto/workspace)
├── Tab 1 (equivalente a tmux window)
│   ├── Window/Pane 1 (split)
│   ├── Window/Pane 2 (split)
│   └── Window/Pane 3 (split)
├── Tab 2
│   └── Window/Pane 1
└── Tab 3
    ├── Window/Pane 1
    └── Window/Pane 2
```

## Próximos pasos

1. **Splits**: Prueba `Ctrl+a` + `v` (vertical) y `Ctrl+a` + `d` (horizontal)
2. **Navegación**: Practica `Ctrl+a` + `h/j/k/l` o directo `Ctrl+h/j/k/l`
3. **Tabs**: Crea tabs con `Ctrl+a` + `c` y navega con `Ctrl+a` + `n` (next) / `Ctrl+a` + `Shift+,` (prev)
4. **Sesiones**: Explora con `Ctrl+a` + `f` para ver todas las sesiones disponibles
5. **Limpieza**: Cuando te sientas cómodo, elimina los atajos LEGACY de `ctrl+b` en `kitty.conf`

## Tips de productividad

- Usa tabs para diferentes contextos dentro de un proyecto (ej: editor, tests, servidor)
- Usa splits dentro de cada tab para ver múltiples shells al mismo tiempo
- Las sesiones son para cambiar completamente de proyecto/workspace
- `Ctrl+a` + `z` es tu mejor amigo para focus temporal en un pane
