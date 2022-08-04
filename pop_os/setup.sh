#!/usr/bin/env bash

sudo add-apt-repository universe

# Add .NET PPA
wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

# update package library and current packages

sudo apt-get update && sudo apt-get upgrade -y

# install necessary packages
sudo apt-get -y install make mercurial curl neovim universal-ctags \
build-essential autoconf autogen libtool flex bison pwgen ranger \
dialog python3-pip pylint pandoc htop jq renameutils checkinstall \
libssl-dev zlib1g-dev libcurl4-openssl-dev nmap pandoc \
twine python3-autopep8 pv zfsutils-linux zsh zsh-doc neofetch \
imagemagick openjdk-11-jdk dotnet-sdk-6.0 \
bat hugo yadm git-extras python-is-python3 docker.io tmux openconnect \
audacity darktable evolution evolution-ews ffmpeg libavcodec-dev \
fonts-firacode gimp gnome-tweaks kdiff3 obs-studio xclip \
libavcodec-extra ubuntu-restricted-extras code fonts-cascadia-code \
caffeine mkvtoolnix golang apt-transport-https handbrake handbrake-cli

dconf load /org/gnome/shell/keybindings/ <<EOF
[/]
switch-to-application-1=['<Super>1']
switch-to-application-2=['<Super>2']
switch-to-application-3=['<Super>3']
switch-to-application-4=['<Super>4']
switch-to-application-5=['<Super>5']
switch-to-application-6=['<Super>6']
switch-to-application-7=['<Super>7']
switch-to-application-8=['<Super>8']
switch-to-application-9=['<Super>9']
EOF

source ./generic/zsh-customizations.sh

flatpak install com.github.tchx84.Flatseal com.google.Chrome

read -p "Install makemkv? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    ./makemkv.sh
fi
