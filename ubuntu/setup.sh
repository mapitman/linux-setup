#!/usr/bin/env bash

sudo apt-get update && sudo apt-get install -y curl nala gpg apt-transport-https lsb-release wget

curl -sL https://raw.githubusercontent.com/wimpysworld/deb-get/main/deb-get | sudo -E bash -s install deb-get
sudo deb-get update


# update package library and current packages
sudo nala upgrade -y

# install new packages
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
libaacs-dev libbluray2 cmake awscli lm-sensors libfuse2 libxi6 libxrender1 \
libxtst6 mesa-utils libfontconfig libgtk-3-bin tar


if uname -a | grep -i -v -q Microsoft
then
    sudo nala install -y docker.io tmux openconnect
fi

source ./ubuntu/fastfetch.sh
source ./generic/zsh-customizations.sh

deb-get install fd

read -p "Install desktop apps? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    source ./ubuntu/setup-desktop.sh

    for file in ./ubuntu/desktop/*.sh
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
