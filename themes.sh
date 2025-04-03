#!/usr/bin/bash

# Opciones de temas
# THEMES_DIR="$HOME/.config/starship-themes"
THEMES=("Catppuccin Mocha" "Catppuccin Latte" "Nord" "Tokyo Night" "Everforest" "OneDark")

# Mostrar opciones y elegir tema
echo "Elige un tema para la terminal:"
select THEME in "${THEMES[@]}"; do
  if [[ -n "$THEME" ]]; then
    # export STARSHIP_CONFIG="$THEMES_DIR/$THEME"
    echo "Usando el tema: $THEME"
    # Usar case para asignar variables según el tema seleccionado
    case "$THEME" in
    "Catppuccin Mocha")
      WEZTERM="Catppuccin Mocha"
      NVIM="catppuccin-mocha"
      ZELLIJ="catppuccin_mocha"
      STARSHIP="catppuccin_mocha.toml"
      ;;
    "Catppuccin Latte")
      WEZTERM="Catppuccin Latte"
      NVIM="catppuccin-latte"
      ZELLIJ="catppuccin_latte"
      STARSHIP="catppuccin_latte.toml"
      ;;
    "Nord")
      WEZTERM="nord"
      NVIM="nord"
      ZELLIJ="nord"
      STARSHIP="nord.toml"
      ;;
    "Tokyo Night")
      WEZTERM="tokyonight"
      NVIM="tokyonight"
      ZELLIJ="tokyonight"
      STARSHIP="tokyonight.toml"
      ;;
    "Everforest")
      WEZTERM="Everforest Dark (Gogh)"
      NVIM="everforest"
      ZELLIJ="everforest"
      STARSHIP="everforest.toml"
      ;;
    "OneDark")
      WEZTERM="One Dark (Gogh)"
      NVIM="onedark"
      ZELLIJ="onedark"
      STARSHIP="onedark.toml"
      ;;
    *)
      echo "Opción no válida."
      ;;
    esac

    break # Salir del loop select después de una selección válida
  else
    echo "Opción inválida. Intenta de nuevo."
  fi
done

# Wezterm
color="config.color_scheme = \"$WEZTERM\""
sed -i '' "/config.color_scheme/ {
  s/.*/$color/
  }" /Users/arch/.config/wezterm/wezterm.lua

# Nvim
color="colorscheme = \"$NVIM\""
sed -i '' "/colorscheme/ {
  s/.*/$color/
  }" /Users/arch/.config/nvim/lua/plugins/ui.lua

# Zellij
color="theme \"$ZELLIJ\""
sed -i '' "/theme \"/ {
  s/.*/$color/
  }" /Users/arch/.config/zellij/config.kdl

layout="default_layout \"$ZELLIJ\""
sed -i '' "/default_layout \"/ {
  s/.*/$layout/
  }" /Users/arch/.config/zellij/config.kdl

# Starship
cp "/Users/arch/dotfiles/.config/starship/$STARSHIP" /Users/arch/.config/starship.toml
