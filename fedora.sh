#!/bin/bash

sudo dnf -y upgrade
sudo dnf -y copr enable thelocehiliosan/yadm
sudo dnf install -y snapd mercurial vim ctags git-extras docker autojump \
    make autoconf autogen libtool flex bison openconnect pwgen ranger \
    dialog yadm python3-pip pylint pandoc tmux htop jq golang bat \
    python3-pypandoc twine python3-autopep8 kubernetes-client \
    NetworkManager-tui light fontawesome-fonts python2-psutil \
    python2-netifaces python2-requests

for file in ./fedora/*.sh
do
    source $file
done

for file in ./generic/*.sh
do
    source $file
done

source ./golang-tools.sh

read -p "Install desktop apps? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    for file in ./fedora/desktop/*.sh
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
    for file in ./fedora/laptop/*.sh
    do
        source $file
    done
fi
