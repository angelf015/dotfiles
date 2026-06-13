# Guía de Atajos de Teclado - Kitty Terminal

## Índice
- [Modificador Principal](#modificador-principal)
- [Configuración](#configuración)
- [Terminal](#terminal)
- [Navegación entre Paneles](#navegación-entre-paneles)
- [Gestión de Ventanas (Paneles)](#gestión-de-ventanas-paneles)
- [Gestión de Pestañas](#gestión-de-pestañas)
- [Layouts (Diseños)](#layouts-diseños)
- [Sesiones de Kitty](#sesiones-de-kitty)
- [Quick Access Terminal](#quick-access-terminal)
- [Scrollback (Historial)](#scrollback-historial)
- [Portapapeles](#portapapeles)
- [Fuentes](#fuentes)
- [Transparencia](#transparencia)
- [Misceláneos](#misceláneos)

---

## Modificador Principal

### kitty_mod
- Definido como: `cmd+option`
- También existe: `ctrl+shift` (en mappings.conf)

---

## Configuración

| Atajo | Acción | Ubicación |
|-------|--------|-----------|
| `ctrl+cmd+,` | Recargar configuración de Kitty | kitty.conf:320 |
| `ctrl+shift+f2` | Editar archivo de configuración | mappings.conf:74 |

---

## Terminal

| Atajo | Acción | Ubicación |
|-------|--------|-----------|
| `cmd+k` | Limpiar terminal (envía Ctrl+L / clear) | kitty.conf:443 |
| `ctrl+shift+delete` | Limpiar terminal (reset activo) | mappings.conf:80 |

---

## Navegación entre Paneles

### Navegación con Neovim integrado (vim-kitty-navigator)
| Atajo | Acción | Ubicación |
|-------|--------|-----------|
| `ctrl+j` | Navegar hacia abajo | kitty.conf:330 |
| `ctrl+k` | Navegar hacia arriba | kitty.conf:331 |
| `ctrl+h` | Navegar a la izquierda | kitty.conf:332 |
| `ctrl+l` | Navegar a la derecha | kitty.conf:333 |

---

## Gestión de Ventanas (Paneles)

### Crear y Cerrar
| Atajo | Acción | Ubicación |
|-------|--------|-----------|
| `cmd+enter` | Nueva ventana/panel | kitty.conf:325 |
| `ctrl+shift+enter` | Nueva ventana/panel | mappings.conf:19 |
| `cmd+option+w` | Cerrar ventana | kitty.conf:343 |
| `ctrl+shift+w` | Cerrar ventana | mappings.conf:20 |

### Navegación
| Atajo | Acción | Ubicación |
|-------|--------|-----------|
| `ctrl+shift+l` | Siguiente ventana | kitty.conf:326 |
| `ctrl+shift+h` | Ventana anterior | kitty.conf:327 |
| `ctrl+shift+]` | Siguiente ventana | mappings.conf:21 |
| `ctrl+shift+[` | Ventana anterior | mappings.conf:22 |

### Organización
| Atajo | Acción | Ubicación |
|-------|--------|-----------|
| `ctrl+cmd+h` | Intercambiar con ventana | kitty.conf:335 |
| `ctrl+shift+f` | Mover ventana adelante | mappings.conf:23 |
| `ctrl+shift+b` | Mover ventana atrás | mappings.conf:24 |
| `ctrl+shift+`\` | Mover ventana al tope | mappings.conf:25 |

### Redimensionar
| Atajo | Acción | Ubicación |
|-------|--------|-----------|
| `ctrl+shift+r` | Iniciar modo redimensionar | mappings.conf:26 |
| `ctrl+cmd+option+h` | Hacer más angosto | kitty.conf:337 |
| `ctrl+cmd+option+l` | Hacer más ancho | kitty.conf:338 |
| `ctrl+cmd+option+k` | Hacer más alto | kitty.conf:339 |
| `ctrl+cmd+option+j` | Hacer más bajo | kitty.conf:340 |
| `ctrl+shift+alt+l` | Redimensionar más angosto | mappings.conf:37 |
| `ctrl+shift+alt+h` | Redimensionar más ancho | mappings.conf:38 |
| `ctrl+shift+alt+k` | Redimensionar más alto | mappings.conf:39 |
| `ctrl+shift+alt+j` | Redimensionar más bajo | mappings.conf:40 |

### Acceso Directo a Ventanas
| Atajo | Acción | Ubicación |
|-------|--------|-----------|
| `ctrl+shift+1` a `ctrl+shift+0` | Ir a ventana 1-10 | mappings.conf:27-36 |

---

## Gestión de Pestañas

### Crear y Cerrar
| Atajo | Acción | Ubicación |
|-------|--------|-----------|
| `cmd+t` | Nueva pestaña (con cwd actual) | kitty.conf:440 |
| `ctrl+shift+t` | Nueva pestaña | mappings.conf:45 |
| `ctrl+shift+q` | Cerrar pestaña | mappings.conf:46 |

### Navegación
| Atajo | Acción | Ubicación |
|-------|--------|-----------|
| `ctrl+shift+right` | Siguiente pestaña | mappings.conf:43 |
| `ctrl+shift+left` | Pestaña anterior | mappings.conf:44 |

### Organización
| Atajo | Acción | Ubicación |
|-------|--------|-----------|
| `ctrl+shift+.` | Mover pestaña adelante | mappings.conf:47 |
| `ctrl+shift+,` | Mover pestaña atrás | mappings.conf:48 |
| `ctrl+shift+alt+t` | Establecer título de pestaña | mappings.conf:49 |

### Acceso Directo
| Atajo | Acción | Ubicación |
|-------|--------|-----------|
| `ctrl+alt+1` | Ir a pestaña 1 | mappings.conf:50 |
| `ctrl+alt+2` | Ir a pestaña 2 | mappings.conf:51 |

---

## Layouts (Diseños)

| Atajo | Acción | Ubicación |
|-------|--------|-----------|
| `ctrl+shift+l` | Siguiente layout | mappings.conf:54 |
| `ctrl+cmd+option+u` | Layout "tall" | kitty.conf:296 |
| `ctrl+cmd+option+i` | Layout "fat" | kitty.conf:297 |
| `ctrl+cmd+option+o` | Layout "stack" | kitty.conf:298 |
| `ctrl+alt+t` | Layout "tall" | mappings.conf:55 |
| `ctrl+alt+s` | Layout "splits" | mappings.conf:56 |
| `ctrl+shift+alt+g` | Layout "grid" | mappings.conf:57 |
| `ctrl+alt+p` | Último layout usado | mappings.conf:58 |

---

## Sesiones de Kitty

### Guardar y Cambiar
| Atajo | Acción | Ubicación |
|-------|--------|-----------|
| `ctrl+shift+s` | Guardar sesión actual | kitty.conf:395 |
| `ctrl+b` `l` | Sesión alternativa/anterior | kitty.conf:423 |
| `ctrl+b` `s` | Selector de sesiones | kitty.conf:427 |
| `ctrl+b` `f` | Selector interactivo (fzf) | kitty.conf:430 |

### Sesiones Predefinidas
| Atajo | Acción | Sesión | Ubicación |
|-------|--------|--------|-----------|
| `ctrl+b` `d` | Ir a sesión dotfiles | dotfiles.kitty-session | kitty.conf:403 |
| `ctrl+b` `o` | Ir a sesión obsidian | obsidian.kitty-session | kitty.conf:404 |
| `ctrl+b` `n` | Ir a sesión networking | networking.kitty-session | kitty.conf:405 |
| `ctrl+b` `h` | Ir a sesión home | home.kitty-session | kitty.conf:406 |
| `ctrl+b` `b` | Ir a sesión blogpost | blogpost.kitty-session | kitty.conf:407 |
| `ctrl+b` `p` | Ir a sesión dots-private | dots-private.kitty-session | kitty.conf:408 |
| `ctrl+b` `a` | Ir a sesión lua | lua.kitty-session | kitty.conf:409 |
| `ctrl+b` `k` | Ir a sesión skitty | skitty.kitty-session | kitty.conf:410 |
| `ctrl+b` `;` | Ir a sesión scripts | scripts.kitty-session | kitty.conf:411 |
| `ctrl+b` `g` | Ir a sesión glove80 | glove80.kitty-session | kitty.conf:412 |
| `ctrl+b` `w` | Ir a sesión work | work.kitty-session | kitty.conf:413 |
| `ctrl+b` `i` | Abrir daily note | Ejecuta script | kitty.conf:416 |

---

## Quick Access Terminal

### Ventanas Flotantes
| Atajo | Acción | Ubicación |
|-------|--------|-----------|
| `cmd+option+a` `d` | Quick access terminal (documentación) | kitty.conf:348 |
| `cmd+option+a` `t` | System task | kitty.conf:349 |
| `cmd+option+a` `c` | Selector de colorscheme | kitty.conf:350 |
| `cmd+option+a` `n` | Daily note (flotante) | kitty.conf:351 |
| `cmd+option+a` `s` | Skitty notes | kitty.conf:352 |

---

## Scrollback (Historial)

| Atajo | Acción | Ubicación |
|-------|--------|-----------|
| `cmd+option+i` | Ver scrollback en Neovim | kitty.conf:367 |
| `ctrl+shift+h` | Mostrar scrollback | mappings.conf:16 |
| `ctrl+shift+up` / `ctrl+shift+k` | Scroll línea arriba | mappings.conf:8-9 |
| `ctrl+shift+down` / `ctrl+shift+j` | Scroll línea abajo | mappings.conf:10-11 |
| `ctrl+shift+page_up` | Scroll página arriba | mappings.conf:12 |
| `ctrl+shift+page_down` | Scroll página abajo | mappings.conf:13 |

---

## Portapapeles

| Atajo | Acción | Ubicación |
|-------|--------|-----------|
| `ctrl+shift+c` | Copiar al portapapeles | mappings.conf:3 |
| `ctrl+shift+v` | Pegar desde portapapeles | mappings.conf:4 |
| `ctrl+shift+s` | Pegar desde selección | mappings.conf:5 |
| `shift+insert` | Pegar desde selección | mappings.conf:6 |
| `ctrl+shift+o` | Pasar selección a programa | mappings.conf:7 |

---

## Fuentes

| Atajo | Acción | Ubicación |
|-------|--------|-----------|
| `ctrl+shift+=` | Aumentar tamaño de fuente | mappings.conf:61 |
| `ctrl+shift+-` | Disminuir tamaño de fuente | mappings.conf:62 |
| `ctrl+shift+backspace` | Resetear tamaño de fuente | mappings.conf:63 |
| `ctrl+shift+f6` | Establecer tamaño a 10.0 | mappings.conf:64-65 |

---

## Transparencia

| Atajo | Acción | Ubicación |
|-------|--------|-----------|
| `cmd+option+a` `m` | Aumentar opacidad (+0.1) | mappings.conf:76 |
| `cmd+option+a` `l` | Disminuir opacidad (-0.1) | mappings.conf:77 |
| `cmd+option+a` `1` | Opacidad total (1.0) | mappings.conf:78 |
| `cmd+option+a` `d` | Opacidad por defecto | mappings.conf:79 |

---

## Misceláneos

| Atajo | Acción | Ubicación |
|-------|--------|-----------|
| `ctrl+shift+e` | Hints (seleccionar texto visible) | mappings.conf:68 |
| `ctrl+shift+f11` | Toggle pantalla completa | mappings.conf:71 |
| `ctrl+shift+f10` | Toggle maximizar | mappings.conf:72 |
| `ctrl+shift+u` | Input Unicode | mappings.conf:73 |
| `ctrl+shift+escape` | Kitty shell window | mappings.conf:75 |

---

## Notas Importantes

### Modificadores
- `kitty_mod` = `cmd+option` (definido en kitty.conf)
- También existe `ctrl+shift` como modificador en mappings.conf

### Secuencias de Teclas
Algunas combinaciones requieren presionar teclas en secuencia:
- `ctrl+b` `d` significa: presiona `ctrl+b`, suelta, luego presiona `d`
- `cmd+option+a` `d` significa: presiona `cmd+option+a`, suelta, luego presiona `d`

### Integración con Neovim
Los atajos `ctrl+h/j/k/l` están configurados para funcionar tanto en Kitty como en Neovim mediante el plugin vim-kitty-navigator.

### Sesiones vs Pestañas
- Las **sesiones** son conjuntos completos de pestañas y ventanas que puedes guardar y cargar
- Las **pestañas** son contenedores dentro de una sesión
- Las **ventanas** son paneles/divisiones dentro de una pestaña

### Recargar Configuración
Después de modificar los archivos de configuración, usa `ctrl+cmd+,` para aplicar los cambios sin reiniciar Kitty.

---

## Archivos de Configuración

- `kitty.conf` - Configuración principal
- `mappings.conf` - Atajos de teclado adicionales
- `tabs.conf` - Configuración de pestañas
- Sesiones guardadas en: `~/github/dotfiles-latest/kitty/sessions/`

## Recursos

- Documentación oficial: https://sw.kovidgoyal.net/kitty/
- vim-kitty-navigator: Para navegación integrada con Neovim
- Quick access terminal: https://sw.kovidgoyal.net/kitty/kittens/quick-access-terminal/
