#!/bin/bash

# install necessary packages
sudo apt-get -y install mercurial curl vim-nox ctags git-extras docker.io autojump \
build-essential autoconf autogen libtool flex bison openconnect xclip pwgen ranger \
dialog yadm fonts-firacode python-pip pylint pandoc

# Setup Golang
gopkg=go1.11.linux-amd64.tar.gz
curl -O https://storage.googleapis.com/golang/$gopkg
sudo tar -C /usr/local -xzf $gopkg
rm $gopkg
source ./golang.sh


# setup nodejs
curl -O https://nodejs.org/dist/v8.10.0/node-v8.10.0-linux-x64.tar.xz
tar xvf node-v8.10.0-linux-x64.tar.xz
pushd node-v8.10.0-linux-x64
sudo cp -R bin /usr/local/
sudo cp -R include /usr/local/
sudo cp -R lib /usr/local/
sudo cp -R share /usr/local/
popd
rm node-v8.10.0-linux-x64.tar.xz
rm -rf node-v8.10.0-linux-x64

# setup some node tools
sudo npm install -g npm
sudo npm install -g gulp eslint

# Setup dotnet core
curl -O https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt install apt-transport-https
sudo apt update
sudo apt install -y dotnet-sdk-2.1
rm packages-microsoft-prod.deb

# install bash-git-prompt
git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1

sudo snap install vscode --classic
sudo snap install slack --classic

curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i --force-depends ./google-chrome-stable_current_amd64.deb
sudo apt install -f
rm google-chrome-stable_current_amd64.deb

curl -O https://prerelease.keybase.io/keybase_amd64.deb
sudo dpkg -i keybase_amd64.deb
sudo apt-get install -f
run_keybase
rm keybase_amd64.deb

pip install pypandoc twine autopep8

# terraform
tf_package=terraform_0.11.8_linux_amd64.zip
curl -O https://releases.hashicorp.com/terraform/0.11.8/$tf_package
unzip terraform_0.11.8_linux_amd64.zip -d ~/bin/
rm $tf_package

# kubectl
sudo snap install --classic kubectl

# minikube
sudo apt-get install -y qemu-kvm libvirt-bin virt-top libguestfs-tools virtinst bridge-utils
sudo systemctl enable virtlockd.service
sudo systemctl start virtlockd.service
sudo modprobe vhost_net
lsmod | grep vhost
sudo -i
echo vhost_net >> /etc/modules
exit

# bluray/dvd
sudo apt-get install libbluray-bdj libaacs0 libdvd-pkg
sudo dpkg-reconfigure libdvd-pkg
mkdir -p ~/.config/aacs/
curl -L -o ~/.config/aacs/KEYDB.cfg http://vlc-bluray.whoknowsmy.name/files/KEYDB.cfg
