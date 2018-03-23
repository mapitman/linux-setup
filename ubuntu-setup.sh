#!/bin/sh

# install necessary packages
sudo apt-get -y install mercurial curl vim-nox ctags git-extras docker.io autojump \
build-essential autoconf autogen libtool flex bison openconnect xclip pwgen

# Setup Golang
curl -O https://storage.googleapis.com/golang/go1.10.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.10.linux-amd64.tar.gz

# setup nodejs
curl -O https://nodejs.org/dist/v8.10.0/node-v8.10.0-linux-x64.tar.xz
tar xvf node-v8.10.0-linux-x64.tar.xz
cd node-v8.10.0-linux-x64
sudo cp -R bin /usr/local/
sudo cp -R include /usr/local/
sudo cp -R lib /usr/local/
sudo cp -R share /usr/local/

# setup some node tools
sudo npm install -g npm
sudo npm install -g gulp eslint coffee

# Setup dotnet core
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-artful-prod artful main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-get install -y apt-transport-https
sudo apt-get update
sudo apt-get install -y dotnet-sdk-2.1.101

# setup bash-git-prompt
git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1

if ! grep -Fxq "GIT_PROMPT_ONLY_IN_REPO=1" ~/.bashrc
then
    echo GIT_PROMPT_ONLY_IN_REPO=1 >> ~/.bashrc
fi
if ! grep -Fxq "source ~/.bash-git-prompt/gitprompt.sh" ~/.bashrc
then
    echo source source ~/.bash-git-prompt/gitprompt.sh >> ~/.bashrc
fi

sudo snap install vscode --classic
