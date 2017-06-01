# My dotfiles
いろいろ増えてきたのでメモ
基本的にUbuntuの環境構築用

## PATHの設定
困ったら.profileに書く。再起動。

## php
https://www.colinodell.com/blog/2016-12/installing-php-7-1

```
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install php7.1-cli php7.1-xml php7.1-curl php7.1-dev
```
サーバーは必要ないのでcli。

### composer
https://getcomposer.org/download/

```
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer
```

PATHを通す
```
### composer ###
export PATH=$PATH:$HOME/.config/composer/vendor/bin
```

### padawan
- https://github.com/padawan-php/padawan.php
- https://github.com/padawan-php/deoplete-padawan

なんか普通にインストールしても何故か動かない問題↓

https://github.com/padawan-php/padawan.php/issues/95
```
{
    "minimum-stability": "dev"
}
```
とだけ書いたcomposer.jsonを~/.config/composerに用意してから、
```
composer global require mkusher/padawan:dev-master
```
とする


## ctags
```
cd ~/src
git clone git@github.com:universal-ctags/ctags.git
cd ctags
./autogen.sh
./configure
make
sudo make install
```

## fish shell
```
sudo apt-add-repository ppa:fish-shell/release-2
sudo apt-get update
sudo apt-get install fish
mkdir -p ~/.config/fish
cd ~/.config/fish
ln -s ~/dotfiles/fish/config.fish
```

## golang
- https://github.com/golang/go/wiki/Ubuntu
- http://golang-jp.org/doc/install

2個めの方参考に入れた
apt-getのほうが楽かも


PATH
```
### golang ###
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
```

## docker
ころころ変わるので公式見に行ったほうが早い
