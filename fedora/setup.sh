#!/usr/bin/env bash

sudo dnf -y upgrade
sudo dnf install -y mercurial vim ctags git-extras docker autojump \
    make autoconf autogen libtool flex bison openconnect pwgen ranger \
    dialog python3-pip pylint pandoc tmux htop jq golang bat \
    python3-pypandoc twine python3-autopep8 kubernetes-client \
    NetworkManager-tui light python2-psutil \
    python2-netifaces python2-requests autojump nodejs w3m

sudo npm install -g npm
sudo npm install -g gulp eslint

for file in ./generic/*.sh
do
    source $file
done

source ./golang-tools.sh

read -p "Install desktop apps? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    source ./setup-desktop.sh

    for file in ./generic/desktop/*.sh
    do
        source $file
    done
fi

read -p "Install laptop apps? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
   source ./setup-laptop.sh
fi
