# setting inputrc
mv ~/.inputrc ~/.inputrc_bk
ln -s ~/dotfiles/home/inputrc ~/.inputrc

# setting xremap
ln -s ~/dotfiles/config/xremap.yml ~/.config
cargo install xremap --features kde
sudo systemctl link ~/dotfiles/service/xremap.service
sudo systemctl enable ~/dotfiles/service/xremap.service

# install wezterm
sudo zypper in -y wezterm
mv ~/.wezterm.lua ~/.wezterm.lua_bk
ln -s ~/dotfiles/home/wezterm.lua ~/.wezterm.lua

# profile config
echo "xinput set-button-map 'Kensington Expert Wireless TB Mouse' 1 8 3 4 5 6 7 9 10 11 12" >> ~/.profile
