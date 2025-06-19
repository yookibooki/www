#!/bin/bash
set -e
echo "🚀 Starting Arch Linux development setup..."

# System update
sudo pacman -Syu --noconfirm

# Essential development tools
sudo pacman -S --needed --noconfirm git base-devel

# Install yay if not present
if ! command -v yay &> /dev/null; then
    echo "Installing yay AUR helper..."
    git clone https://aur.archlinux.org/yay-bin.git
    cd yay-bin
    makepkg -si --noconfirm || {
        echo "❌ Failed to install yay"
        exit 1
    }
    cd ~
    rm -rf yay-bin
fi

# Core packages
sudo pacman -S --needed --noconfirm \
    zsh tmux neovim htop bat fzf ripgrep wget \
    i3-wm i3blocks rofi dunst picom alacritty \
    xorg-server xorg-xinit

# AUR packages only if not already installed
for pkg in brave-bin visual-studio-code-bin; do
  if ! yay -Qi "$pkg" &>/dev/null; then
    yay -S --noconfirm "$pkg"
  fi
done

# Final instructions
cat <<'EOF'

✅ Setup complete!

To install your dotfiles, run:
  curl -sSL https://raw.githubusercontent.com/dikiaap/dotfiles/\
refs/heads/master/install.sh \
    | bash -s -- -i    # -i to install, use -r to restore

EOF
