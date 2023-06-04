#!/usr/bin/env bash

sudo apt install -y curl nala

# Add .NET PPA
curl -O https://packages.microsoft.com/config/ubuntu/23.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb


# Quickemu PPA
sudo apt-add-repository -y ppa:flexiondotorg/quickemu

# Papirus Icons
sudo add-apt-repository -y ppa:papirus/papirus

# update package library and current packages

sudo nala update && sudo nala upgrade

sudo nala install apt-transport-https && sudo nala update

# install necessary packages
sudo nala install \
make mercurial curl neovim universal-ctags \
build-essential autoconf autogen libtool flex bison pwgen ranger \
dialog python3-pip pylint pandoc htop jq renameutils checkinstall \
libssl-dev zlib1g-dev libcurl4-openssl-dev nmap pandoc \
twine python3-autopep8 pv zfsutils-linux zsh zsh-doc \
imagemagick openjdk-11-jdk dotnet-sdk-6.0 dotnet-sdk-7.0 \
bat hugo yadm git-extras python-is-python3 docker.io tmux openconnect \
ffmpeg libavcodec-dev \
libavcodec-extra ubuntu-restricted-extras code  \
mkvtoolnix golang apt-transport-https handbrake-cli \
libaacs-dev libbluray2 quickemu cmake


if uname -a | grep -i -v -q Microsoft
then
    sudo nala install docker.io tmux openconnect
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
