This repository is made for openSUSE.

# セットアップ

github cliをインストール   
`https://github.com/cli/cli/blob/trunk/docs/install_linux.md`

`dotfiles`をクローン  
`gh repo clone kapiyva/dotfiles ~/dotfiles`

インストールスクリプトを実行  
`sudo chmod +x ~/dotfiles/install.sh && ~/dotfiles/install.sh`

# 手動インストール対象

## Rust

`https://www.rust-lang.org/ja/learn/get-started`

## asdf

`https://asdf-vm.com/guide/getting-started.html`

---

# for Desktop

## xremap

1. `xremap`のインストール
`cargo install xremap --features kde`

2. systemdに登録
- ファイルの作成
- サービスの起動
- .profileにサービス起動の設定追加
