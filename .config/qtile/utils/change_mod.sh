#!/usr/bin/bash
path=/home/archi/.config/qtile
mod=$(jq '.mod' "$path"/cfg.json)
echo "$mod"
if [ "$mod" == "false" ]; then
  jq '.mod = true' "$path"/cfg.json > "$path"/cfg_modificados.json && mv "$path"/cfg_modificados.json "$path"/cfg.json
else
  jq '.mod = false' "$path"/cfg.json > "$path"/cfg_modificados.json && mv "$path"/cfg_modificados.json "$path"/cfg.json
fi
