#!/bin/bash

# install necessary packages
sudo apt-get -y install mercurial curl vim-nox ctags git-extras docker.io autojump \
build-essential autoconf autogen libtool flex bison openconnect xclip pwgen ranger dialog yadm

# Setup Golang
curl -O https://storage.googleapis.com/golang/go1.10.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.10.linux-amd64.tar.gz
rm go1.10.linux-amd64.tar.gz

# setup nodejs
curl -O https://nodejs.org/dist/v8.10.0/node-v8.10.0-linux-x64.tar.xz
tar xvf node-v8.10.0-linux-x64.tar.xz
pushd node-v8.10.0-linux-x64
sudo cp -R bin /usr/local/
sudo cp -R include /usr/local/
sudo cp -R lib /usr/local/
sudo cp -R share /usr/local/
popd
rm node-v8.10.0-linux-x64.tar.xz
rm -rf node-v8.10.0-linux-x64

# setup some node tools
sudo npm install -g npm
sudo npm install -g gulp eslint

# Setup dotnet core
curl -O https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt install apt-transport-https
sudo apt update
sudo apt install -y dotnet-sdk-2.1
rm packages-microsoft-prod.deb

# install bash-git-prompt
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

sudo snap install vscode --classic
sudo snap install slack --classic

curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i --force-depends ./google-chrome-stable_current_amd64.deb
sudo apt install -f
rm google-chrome-stable_current_amd64.deb
