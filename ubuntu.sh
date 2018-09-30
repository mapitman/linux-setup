#!/bin/bash

# install necessary packages
sudo apt-get -y install mercurial curl vim-nox ctags git-extras docker.io autojump \
build-essential autoconf autogen libtool flex bison openconnect xclip pwgen ranger \
dialog yadm fonts-firacode python-pip pylint pandoc

sudo snap install vscode --classic
sudo snap install slack --classic

for file in ./ubuntu/*.sh
do
    source $file
done

source ./golang-tools.sh
