#!/usr/bin/env bash

sudo add-apt-repository -y universe

sudo nala install -y audacity pipx \
darktable evolution evolution-ews ffmpeg libavcodec-dev \
fonts-firacode gimp gnome-tweaks kdiff3 obs-studio xclip \
libavcodec-extra ubuntu-restricted-extras fonts-cascadia-code \
handbrake gnome-browser-connector

sudo snap install --classic code
pipx ensurepath
deb-get install android-messages-desktop youtube-music quickemu \
papirus-icon-theme mdview

pwd
source ./generic/jetbrains-toolbox.sh

# bluray/dvd
read -p "Install Bluray/DVD tools? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo nala install -y libbluray-bdj libaacs0 libdvd-pkg
    sudo dpkg-reconfigure libdvd-pkg
    mkdir -p ~/.config/aacs/
curl -k -L -o ~/.config/aacs/KEYDB.cfg http://vlc-bluray.whoknowsmy.name/files/KEYDB.cfg
fi

if [[ ! -f /usr/bin/makemkv ]]
then
    read -p "Install makemkv? " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        ./ubuntu/makemkv.sh
    fi
fi
