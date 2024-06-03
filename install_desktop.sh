# setting xremap
ln -s ~/dotfiles/.config/xremap.yml ~/.config
cargo install xremap --features kde
sudo systemctl link ~/dotfiles/service/xremap.service
sudo systemctl enable xremap.service
