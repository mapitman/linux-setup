#!/bin/bash
sudo add-apt-repository universe

sudo apt install -y audacity libbluray-bdj libaacs0 libdvd-pkg \
darktable evolution evolution-ews ffmpeg ffmpeg-devel \
flameshot fonts-firacode ttf-mscorefonts-installer gimp gnome-tweaks \
kdiff3 obs-studio xclip libavcodec-extra

sudo snap install chromium

# bluray/dvd
sudo dpkg-reconfigure libdvd-pkg
mkdir -p ~/.config/aacs/
curl -L -o ~/.config/aacs/KEYDB.cfg http://vlc-bluray.whoknowsmy.name/files/KEYDB.cfg

# keybase
keybasepkg=keybase_amd64.deb
curl -O https://prerelease.keybase.io/$keybasepkg
sudo dpkg -i $keybasepkg
sudo apt-get install -f -y
run_keybase
rm $keybasepkg

# slack
curl -o /tmp/slack-desktop-4.2.0-amd64.deb  https://downloads.slack-edge.com/linux_releases/slack-desktop-4.2.0-amd64.deb
sudo dpkg -i /tmp/slack-desktop-4.2.0-amd64.deb
sudo apt install -fy

# vscode
curl -o /tmp/vscode.deb https://az764295.vo.msecnd.net/stable/f359dd69833dd8800b54d458f6d37ab7c78df520/code_1.40.2-1574694120_amd64.deb
sudo dpkg -i /tmp/vscode.deb
sudo apt install -fy
