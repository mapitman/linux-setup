#!/usr/bin/env bash

sudo dnf -y upgrade
sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/home:TheLocehiliosan:yadm/Fedora_39/home:TheLocehiliosan:yadm.repo
sudo dnf install -y mercurial neovim ctags docker zsh \
    make autoconf autogen libtool flex bison pwgen ranger \
    dialog python3-pip pylint pandoc tmux htop jq bat \
    python3-pypandoc twine python3-autopep8 yadm golang\
    NetworkManager-tui light python3-psutil fastfetch \
    python3-netifaces python3-requests w3m \
    dotnet-sdk-6.0 dotnet-sdk-7.0 dotnet-sdk-8.0 util-linux-user

read -p "Install desktop apps? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    source ./fedora/setup-desktop.sh
fi

read -p "Install laptop apps? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
   source ./fedors/setup-laptop.sh
fi
