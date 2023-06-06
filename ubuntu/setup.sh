#!/usr/bin/env bash

sudo apt-get update && sudo apt-get install -y curl nala

# Add .NET PPA
curl -O https://packages.microsoft.com/config/ubuntu/23.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

sudo nala -y install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

# Quickemu PPA
sudo apt-add-repository -y ppa:flexiondotorg/quickemu

# Papirus Icons
sudo add-apt-repository -y ppa:papirus/papirus

# update package library and current packages

sudo nala update && sudo nala upgrade

sudo nala install -y apt-transport-https && sudo nala update

# install necessary packages
sudo nala install -y \
make mercurial curl neovim universal-ctags \
build-essential autoconf autogen libtool flex bison pwgen ranger \
dialog python3-pip pylint pandoc htop jq renameutils checkinstall \
libssl-dev zlib1g-dev libcurl4-openssl-dev nmap pandoc \
twine python3-autopep8 pv zfsutils-linux zsh zsh-doc \
imagemagick openjdk-11-jdk dotnet-sdk-6.0 dotnet-sdk-7.0 \
bat hugo yadm git-extras python-is-python3 docker.io tmux openconnect \
ffmpeg libavcodec-dev \
libavcodec-extra ubuntu-restricted-extras  \
mkvtoolnix golang apt-transport-https handbrake-cli \
libaacs-dev libbluray2 quickemu cmake code


if uname -a | grep -i -v -q Microsoft
then
    sudo nala install -y docker.io tmux openconnect
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
