#!/usr/bin/env bash

sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf copr -y enable evana/fira-code-fonts
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update


sudo dnf install -y audacity darktable evolution ffmpeg ffmpeg-devel \
fira-code-fonts powerline-fonts gimp gnome-shell-extension-dash-to-dock \
gnome-tweaks kdiff3 code w3m-img fontawesome-fonts xclip

sudo yum install -y https://prerelease.keybase.io/keybase_amd64.rpm
run_keybase
