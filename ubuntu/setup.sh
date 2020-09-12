#!/usr/bin/env bash

# update package library and current packages

sudo apt-get update && sudo apt-get upgrade -y

# install necessary packages
sudo apt-get -y install make mercurial curl vim-nox ctags git-extras autojump \
build-essential autoconf autogen libtool flex bison pwgen ranger \
dialog python3-pip pylint pandoc htop jq renameutils checkinstall \
libssl-dev zlib1g-dev libcurl4-openssl-dev nmap pandoc \
twine python3-autopep8 silversearcher-ag pv zfsutils-linux

if uname -a | grep -i -v -q Microsoft
then
    sudo apt-get -y install docker.io tmux openconnect
fi

# bat (cat with wings!)
batpkg=bat_0.8.0_amd64.deb
curl -L -O https://github.com/sharkdp/bat/releases/download/v0.8.0/$batpkg
sudo dpkg -i ./$batpkg
rm ./$batpkg


read -p "Install desktop apps? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    source ./ubuntu/setup-desktop.sh

    for file in ./ubuntu/desktop/*.sh
    do
        source $file
    done

    for file in ./generic/desktop/*.sh
    do
        source $file
    done
fi

read -p "Install laptop apps? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    for file in ./ubuntu/laptop/*.sh
    do
        source $file
    done
fi
