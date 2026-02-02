#!/bin/bash

# Install tools via zypper for OpenSUSE Tumbleweed
sudo zypper install -y \
    neovim \
    eza \
    bat \
    starship \
    ripgrep \
    lazygit \
    fd

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
