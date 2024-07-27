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
sudo zypper in -y fd
sudo zypper in -y direnv

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# deploy dotfiles
mv ~/.bashrc ~/.bashrc_bk
ln -s ~/dotfiles/home/bashrc ~/.bashrc

mv ~/.alias ~/.alias_bk
ln -s ~/dotfiles/home/alias ~/.alias

mv ~/.gitconfig ~/.gitconfig_bk
ln -s ~/dotfiles/home/gitconfig ~/.gitconfig

mv ~/.config/nvim ~/.config/nvim_bk
ln -s ~/dotfiles/config/nvim ~/.config/
