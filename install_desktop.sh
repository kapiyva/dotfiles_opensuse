# setting xremap
ln -s ~/dotfiles/config/xremap.yml ~/.config
cargo install xremap --features kde
sudo systemctl link ~/dotfiles/service/xremap.service
sudo systemctl enable ~/dotfiles/service/xremap.service

# install wezterm
sudo zypper in -y wezterm
mv ~/.wezterm.lua ~/.wezterm.lua_bk
ln -s ~/dotfiles/home/wezterm.lua ~/.wezterm.lua
