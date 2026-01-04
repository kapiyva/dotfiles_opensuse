#!/bin/bash

# Check if devbox is installed
if ! command -v devbox &> /dev/null; then
    echo "Error: devbox is not installed."
    echo "Please install devbox first: https://www.jetify.com/devbox/docs/installing_devbox/"
    exit 1
fi

# Install tools via devbox global
devbox global add neovim@latest
devbox global add eza@latest
devbox global add bat@latest
devbox global add starship@latest
devbox global add ripgrep@latest
devbox global add lazygit@latest
devbox global add fd@latest
devbox global add zellij@latest

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
