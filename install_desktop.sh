#!/bin/bash
# Idempotent desktop setup script: safe to run multiple times.
set -euo pipefail

DOTFILES="$HOME/dotfiles"
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

# install desktop tools (already-installed packages are skipped)
sudo zypper install -y \
    alacritty \
    zellij

# setting inputrc
link "$DOTFILES/home/inputrc" "$HOME/.inputrc"

# setting xremap
if [ ! -x "$HOME/.local/bin/xremap" ]; then
    echo "Please install xremap here: https://github.com/xremap/xremap"
fi
link "$DOTFILES/config/xremap.yml" "$HOME/.config/xremap.yml"
if ! systemctl cat xremap.service &> /dev/null; then
    sudo systemctl link "$DOTFILES/service/xremap.service"
fi
sudo systemctl enable xremap.service

# setting alacritty
link "$DOTFILES/config/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"

# setting zellij
link "$DOTFILES/config/zellij.kdl" "$HOME/.config/zellij/config.kdl"

# profile config
append_line "xinput set-button-map 'Kensington Expert Wireless TB Mouse' 1 8 3 4 5 6 7 9 10 11 12" "$HOME/.profile"
