#!/usr/bin/env bash

# Add .NET PPA
wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

# update package library and current packages

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install -y apt-transport-https && sudo apt-get update

# install necessary packages
sudo apt-get -y install make mercurial curl vim-nox universal-ctags \
build-essential autoconf autogen libtool flex bison pwgen ranger \
dialog python3-pip pylint pandoc htop jq renameutils checkinstall \
libssl-dev zlib1g-dev libcurl4-openssl-dev nmap pandoc \
twine python3-autopep8 pv zfsutils-linux zsh zsh-doc neofetch \
imagemagick openjdk-11-jdk dotnet-sdk-6.0 \
bat hugo yadm git-extras

if uname -a | grep -i -v -q Microsoft
then
    sudo apt-get -y install docker.io tmux openconnect
fi

source ./generic/zsh-customizations.sh

read -p "Install desktop apps? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    source ./pop_os/setup-desktop.sh
fi

read -p "Install laptop apps? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    source ./pop_os/setup-laptop.sh
fi
