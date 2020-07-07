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


gopkg=go1.14.linux-amd64.tar.gz
curl -O https://dl.google.com/go/$gopkg
sudo tar -C /usr/local -xzf $gopkg
rm $gopkg

# Setup Golang paths
mkdir -p ~/go
mkdir -p ~/go/bin
mkdir -p ~/go/pkg
mkdir -p ~/go/src

source ./golang-tools.sh

node_version=12.16.1
node_file=node-v${node_version}-linux-x64

curl -O "https://nodejs.org/dist/v${node_version}/${node_file}.tar.xz"
tar xvf "${node_file}.tar.xz"
pushd $node_file
sudo cp -R bin /usr/local/
sudo cp -R include /usr/local/
sudo cp -R lib /usr/local/
sudo cp -R share /usr/local/
popd
rm "${node_file}.tar.xz"
rm -rf $node_file

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
