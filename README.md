# My dotfiles
いろいろ増えてきたのでメモ
基本的にUbuntuの環境構築用

## php
https://www.colinodell.com/blog/2016-12/installing-php-7-1

```
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install php7.1-cli
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

### padawan
https://github.com/padawan-php/padawan.php
https://github.com/padawan-php/deoplete-padawan

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
