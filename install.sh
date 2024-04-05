# install tools
sudo zypper in neovim
sudo zypper in eza
sudo zypper in bat
sudo zypper in starship

# replace dotfiles
mv ~/.bashrc ~/.bashrc_bk
ln -s ~/dotfiles/.bashrc ~

mv ~/.alias ~/.alias_bk
ln -s ~/dotfiles/.alias ~

mv ~/.gitconfig ~/.gitconfig_bk
ln -s ~/dotfiles/.gitconfig ~

mkdir .config
gh repo clone kapiyva/neovim_config ~/.config/nvim
