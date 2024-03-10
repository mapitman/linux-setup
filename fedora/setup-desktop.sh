#!/usr/bin/env bash

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

sudo dnf install -y ffmpeg ffmpeg-devel gitk git-gui cascadia-code-fonts\
    fira-code-fonts powerline-fonts gnome-shell-extension-dash-to-dock \
    gnome-tweaks kdiff3 code w3m-img fontawesome-fonts xclip hyprland \
    java-latest-openjdk audacity darktable evolution \
    gimp krita 

#sudo yum install -y https://prerelease.keybase.io/keybase_amd64.rpm
#run_keybase
