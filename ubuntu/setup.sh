#!/usr/bin/env bash

# Add .NET PPA
wget https://packages.microsoft.com/config/ubuntu/21.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
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
imagemagick openjdk-11-jdk dotnet-sdk-6.0 dotnet-sdk-3.1 dotnet-sdk-5.0

if uname -a | grep -i -v -q Microsoft
then
    sudo apt-get -y install docker.io tmux openconnect
fi

# bat (cat with wings!)
if grep -Fq "Pop" /etc/os-release
then
    sudo apt-get -y install bat
else
    batpkg=bat_0.12.1_amd64.deb
    curl -L -O https://github.com/sharkdp/bat/releases/download/v0.12.1/$batpkg
    sudo dpkg -i ./$batpkg
    rm ./$batpkg
fi

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
    source ./ubuntu/setup-laptop.sh
fi
