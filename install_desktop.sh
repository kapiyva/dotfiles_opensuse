cargo install xremap --features kde
sudo ln -s ~/dotfiles/etc/systemd/system/xremap.service /etc/systemd/system/
sudo systemctl enable xremap.service
