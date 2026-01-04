# setting inputrc
mv ~/.inputrc ~/.inputrc_bk
ln -s ~/dotfiles/home/inputrc ~/.inputrc

# setting xremap
echo "Prease install xremap here: https://github.com/xremap/xremap"
ln -s ~/dotfiles/config/xremap.yml ~/.config
sudo systemctl link ~/dotfiles/service/xremap.service
sudo systemctl enable ~/dotfiles/service/xremap.service

# install alacritty
sudo zypper in alacritty
mkdir -p ~/.config/alacritty
mv ~/.config/alacritty/config ~/.config/alacritty/config_bk
ln -s ~/dotfiles/config/alacritty.toml ~/.config/alacritty/alacritty.toml

# profile config
echo "xinput set-button-map 'Kensington Expert Wireless TB Mouse' 1 8 3 4 5 6 7 9 10 11 12" >> ~/.profile
