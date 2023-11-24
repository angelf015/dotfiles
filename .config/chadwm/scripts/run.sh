#!/bin/sh

xrdb merge ~/.Xresources 
xbacklight -set 10 &
# feh --bg-fill ~/wallpaper/anya-forger-spy-x-family_3840x2160_xtrafondos.com.jpg &
xset r rate 200 50 &
picom &

bash ~/.config/chadwm/scripts/wallpaper & 
dash ~/.config/chadwm/scripts/bar.sh &
while type chadwm >/dev/null; do chadwm && continue || break; done
