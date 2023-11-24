#!/usr/bin/fish
# Directorio donde se encuentran las imágenes
set fondos "wallpaper"

# Tiempo en segundos entre cada cambio de fondo
set intervalo 600

# Bucle infinito
while true
    # Obtén el nombre de una imagen aleatoria del directorio de fondos
    set fondo $(ls $fondos | shuf -n 1)

    # Establece el fondo de escritorio
    feh --bg-fill "$fondos/$fondo"

    # Espera el intervalo especificado
    sleep $intervalo
end

