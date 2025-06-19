#!/bin/bash
set -e
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm git base-devel
cd /tmp
rm -rf yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd "$HOME"
sudo pacman -S --noconfirm zsh tmux neovim htop bat fzf ripgrep wget i3-wm i3blocks rofi dunst picom alacritty
yay -S --noconfirm brave-bin visual-studio-code-bin
echo "✅ Setup complete!"
