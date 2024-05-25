# add repository
sudo zypper ar https://download.opensuse.org/repositories/devel:/languages:/go/openSUSE_Factory/devel:languages:go.repo
# install tools
sudo zypper in -y --type pattern devel_basis
sudo zypper in -y neovim
sudo zypper in -y eza
sudo zypper in -y bat
sudo zypper in -y starship
sudo zypper in -y ripgrep
sudo zypper in -y lazygit

# replace dotfiles
mv ~/.bashrc ~/.bashrc_bk
ln -s ~/dotfiles/.bashrc ~

mv ~/.alias ~/.alias_bk
ln -s ~/dotfiles/.alias ~

mv ~/.gitconfig ~/.gitconfig_bk
ln -s ~/dotfiles/.gitconfig ~

mkdir .config
gh repo clone kapiyva/neovim_config ~/.config/nvim

ln -s ~/dotfiles/.config/xremap.yml ~/.config
