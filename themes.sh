#!/usr/bin/bash

# Opciones de temas
THEMES=("Catppuccin Mocha" "Catppuccin Latte" "Nord" "Tokyo Night" "Everforest" "OneDark" "Solarized")

# Mostrar opciones y elegir tema
echo "Elige un tema para la terminal:"
select THEME in "${THEMES[@]}"; do
  if [[ -n "$THEME" ]]; then
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
      WEZTERM="Tokyo Night Moon"
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
    "Solarized")
      WEZTERM="Solarized (dark) (terminal.sexy)"
      NVIM="solarized-osaka"
      ZELLIJ="onedark"
      STARSHIP="solarized.toml"
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

# Cambia el tema en Wezterm, Nvim, Zellij y Starship

# Wezterm
color="config.color_scheme = \"$WEZTERM\""
colors="config.colors = wezterm.color.get_builtin_schemes()[\"$WEZTERM\"]"
theme="theme = \"$WEZTERM\","
sed -i '' "/config.color_scheme/ {
  s/.*/$color/
  }" /Users/arch/.config/wezterm/lua/config/options.lua
sed -i '' "/config.colors/ {
  s/.*/$colors/
  }" /Users/arch/.config/wezterm/lua/config/options.lua
sed -i '' "/theme/ {
  s/.*/$theme/
  }" /Users/arch/.config/wezterm/lua/plugins/tabline.lua

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
