#!/usr/bin/env bash

# distro independent changes
generic () {
    for file in ./generic/*.sh
    do
        source $file
    done
}

# Add some directories
echo "Setting up source directories..."

mkdir -p ~/src/github
mkdir -p ~/src/gitlab
mkdir -p ~/src/work
mkdir -p ~/bin

# source distro dependent file
if grep -Fq "Pop!_OS" /etc/os-release
then
    echo "Detected Pop!_OS"
    source ./pop_os/setup.sh
elif grep -Fq "ubuntu" /etc/os-release
then
    echo "Detected Ubuntu or Ubuntu derivative"
    source ./ubuntu/setup.sh
    generic
elif grep -Fq "endeavouros" /etc/os-release
then
    echo "Detected EndeavourOS"
    source ./endeavouros/setup.sh
elif grep -Fq "arch" /etc/os-release
then
    echo "Detected Arch or Arch derivative"
    source ./arch/setup.sh
elif grep -Fq "Fedora" /etc/os-release
then
    echo "Detected Fedora"
    source ./fedora/setup.sh
    generic
else
    echo "Unable to detect distro or distro unsupported :("
    exit
fi

# add current user to docker group
echo "Adding current user to docker group..."
sudo usermod -aG docker $USER
#source ./vim.sh

