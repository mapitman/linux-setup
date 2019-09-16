#!/bin/bash

# update package library and current packages

sudo apt-get update && sudo apt-get upgrade -y

# install necessary packages
sudo apt-get -y install mercurial curl vim-nox ctags git-extras docker.io autojump \
build-essential autoconf autogen libtool flex bison openconnect pwgen ranger \
dialog yadm python-pip pylint pandoc tmux htop jq

for file in ./ubuntu/*.sh
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
    for file in ./ubuntu/laptop/*.sh
    do
        source $file
    done
fi
