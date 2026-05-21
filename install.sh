#!/bin/bash

# Install tools via zypper for OpenSUSE Tumbleweed
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

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install turso
curl -sSfL https://get.tur.so/install.sh | bash

# install doppler
(curl -Ls --tlsv1.2 --proto "=https" --retry 3 https://cli.doppler.com/install.sh || wget -t 3 -qO- https://cli.doppler.com/install.sh) | sudo sh

# deploy dotfiles
mv ~/.bashrc ~/.bashrc_bk
ln -s ~/dotfiles/home/bashrc ~/.bashrc

mv ~/.alias ~/.alias_bk
ln -s ~/dotfiles/home/alias ~/.alias

mv ~/.gitconfig ~/.gitconfig_bk
ln -s ~/dotfiles/home/gitconfig ~/.gitconfig

mv ~/.config/nvim ~/.config/nvim_bk
ln -s ~/dotfiles/config/nvim ~/.config/

mv ~/.config/lazygit ~/.config/lazygit_bk
ln -s ~/dotfiles/config/lazygit ~/.config/

mv ~/.cspell.yaml ~/.cspell.yaml_bk
ln -s ~/dotfiles/home/cspell.yaml ~/.cspell.yaml

# install cspell
source
npm install -g cspell
