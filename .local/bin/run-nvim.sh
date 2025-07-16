#!/bin/bash
# Script para lanzar Neovim con una versión específica de Node.js usando fnm

# 1. Carga el entorno de FNM para esta sesión de script.
# Esto es crucial: ejecuta `fnm env` y le pasa su salida al shell actual para que la ejecute.
# Así se configura la variable PATH para que el script encuentre las versiones de node de fnm.
eval "$(fnm env --shell=zsh)"

# 2. Activa una versión de Node.js moderna y estable.
# Puedes usar un alias como 'lts-latest' o un número de versión mayor como '20'.
fnm use lts-latest >/dev/null 2>&1

# 3. Ejecuta Neovim, pasando todos los argumentos que se le dieron al script.
# `exec` reemplaza el proceso del script con el de Neovim, lo cual es más eficiente.
exec nvim "$@"
