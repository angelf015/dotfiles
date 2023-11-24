cmake_minimum_required(VERSION 3.26)
project(chadwm C)

set(CMAKE_C_STANDARD 11)

include_directories(chadwm)
include_directories(chadwm/themes)

add_executable(chadwm
        chadwm/themes/catppuccin.h
        chadwm/themes/dracula.h
        chadwm/themes/gruvchad.h
        chadwm/themes/nord.h
        chadwm/themes/onedark.h
        chadwm/themes/tokyonight.h
        chadwm/config.def.h
        chadwm/config.h
        chadwm/drw.c
        chadwm/drw.h
        chadwm/dwm.c
        chadwm/fibonacci.c
        chadwm/functions.h
        chadwm/gaplessgrid.c
        chadwm/movestack.c
        chadwm/shiftview.c
        chadwm/transient.c
        chadwm/util.c
        chadwm/util.h
        chadwm/vanitygaps.c)
