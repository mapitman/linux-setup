#!/bin/bash

# Add some directories
echo "Setting up source directories..."

mkdir -p ~/src/github
mkdir -p ~/src/gitlab
mkdir -p ~/src/work
mkdir -p ~/bin

# source distro dependent file
if grep -Fq "ubuntu" /etc/os-release
then
    echo "Detected Ubuntu or Ubuntu derivative"
    source ./ubuntu.sh
elif grep -Fq "arch" /etc/os-release
then
    echo "Detected Arch or Arch derivative"
    source ./arch.sh
elif grep -Fq "Fedora" /etc/os-release
then
    echo "Detected Fedora"
    source ./fedora/setup.sh
else
    echo "Unable to detect distro or distro unsupported :("
    exit
fi

# distro independent changes

for file in ./generic/*.sh
do
    source $file
done

# add current user to docker group
echo "Adding current user to docker group..."
sudo groupadd docker
sudo usermod -aG docker $USER
source ./vim.sh

