#!/bin/bash

# update package library and current packages

sudo apt-get update && sudo apt-get upgrade -y

# install necessary packages
sudo apt-get -y install mercurial curl vim-nox ctags git-extras autojump \
build-essential autoconf autogen libtool flex bison openconnect pwgen ranger \
dialog python-pip pylint pandoc tmux htop jq renameutils checkinstall \
libssl-dev zlib1g-dev libcurl4-openssl-dev docker.io nmap pandoc \
twine python-autopep8

# bat (cat with wings!)
batpkg=bat_0.8.0_amd64.deb
curl -L -O https://github.com/sharkdp/bat/releases/download/v0.8.0/$batpkg
sudo dpkg -i ./$batpkg
rm ./$batpkg

gopkg=go1.12.7.linux-amd64.tar.gz
curl -O https://storage.googleapis.com/golang/$gopkg
sudo tar -C /usr/local -xzf $gopkg
rm $gopkg

# Setup Golang paths
mkdir -p ~/go
mkdir -p ~/go/bin
mkdir -p ~/go/pkg
mkdir -p ~/go/src

source ./golang-tools.sh

nodeversion=node-v10.13.0-linux-x64

curl -O "https://nodejs.org/dist/v10.13.0/${nodeversion}.tar.xz"
tar xvf "${nodeversion}.tar.xz"
pushd $nodeversion
sudo cp -R bin /usr/local/
sudo cp -R include /usr/local/
sudo cp -R lib /usr/local/
sudo cp -R share /usr/local/
popd
rm "${nodeversion}.tar.xz"
rm -rf $nodeversion

# setup some node tools
sudo npm install -g npm
sudo npm install -g gulp eslint


read -p "Install desktop apps? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    source ./ubuntu/setup-desktop.sh

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
