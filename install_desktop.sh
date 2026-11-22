#!/bin/bash
# Idempotent desktop setup script: safe to run multiple times.
set -euo pipefail

DOTFILES="$HOME/dotfiles"
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

# install desktop tools (already-installed packages are skipped)
sudo zypper install -y \
    alacritty

# setting inputrc
link "$DOTFILES/home/inputrc" "$HOME/.inputrc"

# setting xremap
# SELinux (enforcing since Leap 16) blocks systemd from reading unit files or
# executing binaries under $HOME, so copy both to system locations instead of linking.
link "$DOTFILES/config/xremap.yml" "$HOME/.config/xremap.yml"
if [ -x "$HOME/.local/bin/xremap" ]; then
    if ! cmp -s "$HOME/.local/bin/xremap" /usr/local/bin/xremap; then
        sudo install -m 755 "$HOME/.local/bin/xremap" /usr/local/bin/xremap
        sudo restorecon /usr/local/bin/xremap
    fi
    if [ -L /etc/systemd/system/xremap.service ] || ! cmp -s "$DOTFILES/service/xremap.service" /etc/systemd/system/xremap.service; then
        sudo rm -f /etc/systemd/system/xremap.service /etc/systemd/system/default.target.wants/xremap.service
        sudo install -m 644 "$DOTFILES/service/xremap.service" /etc/systemd/system/xremap.service
        sudo restorecon /etc/systemd/system/xremap.service
        sudo systemctl daemon-reload
    fi
    sudo systemctl enable xremap.service
else
    echo "Please install xremap to ~/.local/bin: https://github.com/xremap/xremap"
fi

# setting alacritty
link "$DOTFILES/config/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"

# setting zellij (not packaged for Leap 16; use the release binary in ~/.local/bin)
if [ ! -x "$HOME/.local/bin/zellij" ]; then
    echo "Please install zellij to ~/.local/bin: https://github.com/zellij-org/zellij/releases"
fi
link "$DOTFILES/config/zellij.kdl" "$HOME/.config/zellij/config.kdl"

# profile config
append_line "xinput set-button-map 'Kensington Expert Wireless TB Mouse' 1 8 3 4 5 6 7 9 10 11 12" "$HOME/.profile"
