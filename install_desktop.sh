# setting inputrc
mv ~/.inputrc ~/.inputrc_bk
ln -s ~/dotfiles/home/inputrc ~/.inputrc

# setting xremap
ln -s ~/dotfiles/config/xremap.yml ~/.config
cargo install xremap --features kde
sudo systemctl link ~/dotfiles/service/xremap.service
sudo systemctl enable ~/dotfiles/service/xremap.service

# install wezterm
# sudo zypper in -y wezterm
# mkdir -p ~/.config/wezterm
# mv ~/.config/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua_bk
# ln -s ~/dotfiles/config/wezterm.lua ~/.config/wezterm/wezterm.lua

# install ghostty
sudo zypper in -y ghostty
mkdir -p ~/.config/ghostty
mv ~/.config/ghostty/config ~/.config/ghostty/config_bk
ln -s ~/dotfiles/config/ghostty ~/.config/ghostty/config

# profile config
echo "xinput set-button-map 'Kensington Expert Wireless TB Mouse' 1 8 3 4 5 6 7 9 10 11 12" >> ~/.profile
