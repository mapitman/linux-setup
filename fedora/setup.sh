#!/usr/bin/env bash

sudo dnf -y upgrade
sudo dnf install -y mercurial vim ctags docker zsh \
    make autoconf autogen libtool flex bison openconnect pwgen ranger \
    dialog python3-pip pylint pandoc tmux htop jq bat \
    python3-pypandoc twine python3-autopep8 kubernetes-client \
    NetworkManager-tui light python3-psutil \
    python3-netifaces python3-requests w3m \
    dotnet-sdk-5.0 dotnet-sdk-3.1 util-linux-user

source ./golang-tools.sh

read -p "Install desktop apps? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    source ./fedora/setup-desktop.sh

    for file in ./generic/desktop/*.sh
    do
        source $file
    done
fi

read -p "Install laptop apps? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
   source ./fedors/setup-laptop.sh
fi
