#!/bin/bash

set -e

# Install tmux
yay -S --noconfirm --needed tmux

# Check if tmux is installed
if ! command -v tmux &>/dev/null; then
  echo "tmux installation failed."
  exit 1
fi

TPM_DIR="$HOME/.tmux/plugins/tpm"

# Check if TPM is already installed
if [ -d "$TPM_DIR" ]; then
  echo "TPM is already installed in $TPM_DIR"
else
  echo "Installing Tmux Plugin Manager (TPM)..."
  git clone https://github.com/tmux-plugins/tpm $TPM_DIR
fi

echo "TPM installed successfully!"

if [-d "~/.config/tmux/plugins/catppuccin"]; then
  echo "Catppuccin theme is already installed."
else
  echo "Installing Catppuccin theme for tmux..."
  mkdir -p ~/.config/tmux/plugins/catppuccin
  git clone -b v2.3.0 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux
fi
