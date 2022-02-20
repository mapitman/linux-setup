#!/usr/bin/env bash

# install arch packages
yay -S --noconfirm --needed base-devel mercurial vim ctags docker \
    autogen openconnect pwgen ranger bind-tools imagemagick zsh python-pip

sudo systemctl enable docker.service
sudo systemctl start docker.service

read -p "Install golang and related tools? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    yay -S --noconfirm --needed go
    source golang-tools.sh
fi

read -p "Install dotnet core sdk and related tools? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    yay -S dotnet-sdk-bin dotnet-sdk-5.0-bin aspnet-runtime
fi


yay -S --needed git-extras hugo yadm pandoc neofetch bat

read -p "Install power management tools? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    yay -S --noconfirm --needed tlp
    echo "Configuring power management services..."
    sudo systemctl enable tlp.service
    sudo systemctl enable tlp-sleep.service
    sudo systemctl mask systemd-rfkill.service
    sudo systemctl mask systemd-rfkill.socket
fi

read -p "Install desktop apps? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    yay -S --needed visual-studio-code-bin ttf-fira-code xclip \
    ttf-cascadia-code freerdp remmina libvncserver google-chrome \
    darktable ffmpeg gimp gnome-tweaks kdiff3 obs-studio \
    chrome-gnome-shell mdview bluez bluez-utils jdk \
    gnome-shell-extension-pop-shell-git

    sudo systemctl enable --now bluetooth
fi

source generic/zsh-customizations.sh
