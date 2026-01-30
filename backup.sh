#!/usr/bin/bash

# Copy dotfiles
rsync -a --delete ~/.config/kitty ~/dotfiles/.config
rsync -a --delete ~/.config/starship.toml ~/dotfiles/.config
rsync -a --delete ~/.config/wezterm ~/dotfiles/.config
rsync -a --delete ~/.config/nvim ~/dotfiles/.config
rsync -a --delete ~/.config/nvim-alt ~/dotfiles/.config
rsync -a --delete ~/.config/zellij ~/dotfiles/.config
rsync -a --delete ~/.ideavimrc ~/dotfiles
rsync -a --delete ~/.config/ghostty ~/dotfiles/.config
rsync -a --delete ~/.local/bin ~/dotfiles/.local
rsync -a --delete ~/.tmux ~/dotfiles
rsync -a --delete ~/.tmux.conf ~/dotfiles
rsync -a --delete ~/.config/opencode/themes ~/dotfiles
