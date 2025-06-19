#!/bin/bash
set -e
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm git base-devel
if ! command -v yay >/dev/null; then
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin
  makepkg -si --noconfirm
  cd ~
  rm -rf yay-bin
fi
sudo pacman -S --noconfirm zsh tmux neovim htop bat fzf ripgrep wget i3-wm i3blocks rofi dunst picom alacritty
yay -S --noconfirm brave-bin visual-studio-code-bin
echo "✅ Setup complete!"
