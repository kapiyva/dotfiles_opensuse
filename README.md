This repository is made for openSUSE.

# セットアップ

github cli をインストール  
`https://github.com/cli/cli/blob/trunk/docs/install_linux.md`

`dotfiles`をクローン  
`gh repo clone kapiyva/dotfiles ~/dotfiles -- --recurse-submodules`

インストールスクリプトを実行  
`sudo chmod +x ~/dotfiles/install.sh && ~/dotfiles/install.sh`

# 手動インストール対象

## asdf

`https://asdf-vm.com/guide/getting-started.html`

---

# for Desktop

## セットアップスクリプト

手動インストールまで完了後、下記のコマンドを実行することでデスクトップ向けのセットアップを行う  
`sudo chmod +x ~/dotfiles/install_desktop.sh && ~/dotfiles/install_desktop.sh`

## フォント

`https://github.com/yuru7/udev-gothic/`
`https://fonts.google.com/specimen/IBM+Plex+Sans`

## ショートカット設定

`kde_shortcuts.kksrc`をインポート
