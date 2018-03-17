#!/bin/bash

echo "Installing apt-fast for Debian based Linux"
pkgver=$(wget -cqO- https://github.com/ilikenwf/apt-fast/releases | grep "tar\.gz" | head -n 1 | cut -d '"' -f 2 | cut -d '/' -f 5 | sed 's/\.tar\.gz//g')
wget -cqO- https://github.com/ilikenwf/apt-fast/archive/$pkgver.tar.gz | tar xz
cd apt-fast*
sudo apt-get install -y aria2
sudo mkdir -p /usr/local/bin
cp apt-fast /usr/local/bin/
sudo chmod +x /usr/local/bin/apt-fast
cp apt-fast.conf /etc
