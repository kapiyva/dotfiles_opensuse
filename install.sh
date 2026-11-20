#!/bin/bash
# Idempotent setup script: safe to run multiple times.
set -euo pipefail

DOTFILES="$HOME/dotfiles"
source "$(dirname "${BASH_SOURCE[0]}")/lib.sh"

# Install tools via zypper for OpenSUSE Tumbleweed (already-installed packages are skipped)
sudo zypper install -y \
    neovim \
    eza \
    bat \
    starship \
    ripgrep \
    lazygit \
    zoxide \
    fd \
    sqlite3

# install mise
if [ ! -x "$HOME/.local/bin/mise" ]; then
    curl https://mise.run | sh
fi

# install rust (PATH is configured in home/bashrc, so don't let rustup modify it)
if [ ! -x "$HOME/.cargo/bin/rustup" ]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
fi

# install turso
if [ ! -x "$HOME/.turso/turso" ]; then
    curl -sSfL https://get.tur.so/install.sh | bash
fi

# install doppler
if ! command -v doppler &> /dev/null; then
    (curl -Ls --tlsv1.2 --proto "=https" --retry 3 https://cli.doppler.com/install.sh || wget -t 3 -qO- https://cli.doppler.com/install.sh) | sudo sh
fi

# deploy dotfiles
link "$DOTFILES/home/bashrc"      "$HOME/.bashrc"
link "$DOTFILES/home/alias"       "$HOME/.alias"
link "$DOTFILES/home/gitconfig"   "$HOME/.gitconfig"
link "$DOTFILES/home/cspell.yaml" "$HOME/.cspell.yaml"
link "$DOTFILES/config/nvim"      "$HOME/.config/nvim"
link "$DOTFILES/config/lazygit"   "$HOME/.config/lazygit"
link "$DOTFILES/config/mise"      "$HOME/.config/mise"

# install tools managed by mise (node)
"$HOME/.local/bin/mise" install

# install cspell (run via mise so this works without sourcing bashrc)
if ! "$HOME/.local/bin/mise" exec -- cspell --version &> /dev/null; then
    "$HOME/.local/bin/mise" exec -- npm install -g cspell
fi
