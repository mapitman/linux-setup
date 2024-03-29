#!/usr/bin/env bash

sudo add-apt-repository -y universe

# Add .NET PPA
curl -O https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

# Quickemu PPA
sudo apt-add-repository -y ppa:flexiondotorg/quickemu

# Papirus Icons
sudo add-apt-repository -y ppa:papirus/papirus


# update package library and current packages

sudo apt-get update && sudo apt-get upgrade -y

# install necessary packages
sudo apt-get -y install \
make mercurial curl neovim universal-ctags \
build-essential autoconf autogen libtool flex bison pwgen ranger \
dialog python3-pip pylint pandoc htop jq renameutils checkinstall \
libssl-dev zlib1g-dev libcurl4-openssl-dev nmap pandoc \
twine python3-autopep8 pv zfsutils-linux zsh zsh-doc \
imagemagick openjdk-11-jdk dotnet-sdk-6.0 dotnet-sdk-7.0 \
bat hugo yadm git-extras python-is-python3 docker.io tmux openconnect \
audacity darktable evolution evolution-ews ffmpeg libavcodec-dev \
fonts-firacode gimp gnome-tweaks kdiff3 obs-studio xclip \
libavcodec-extra ubuntu-restricted-extras code fonts-cascadia-code \
mkvtoolnix golang apt-transport-https handbrake handbrake-cli \
libaacs-dev libbluray2 quickemu powershell cmake nala papirus-icon-theme


flatpak install com.github.tchx84.Flatseal com.google.Chrome

if [[ ! -f /usr/bin/makemkv ]]
then
    read -p "Install makemkv? " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        ./makemkv.sh
    fi
fi

source ./generic/fastfetch.sh
source ./pop_os/dconf.sh
source ./generic/zsh-customizations.sh


