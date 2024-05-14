cargo install xremap --features kde
sudo ln -s ~/dotfiles/service/xremap.service /etc/systemd/system/
sudo systemctl enable xremap.service
