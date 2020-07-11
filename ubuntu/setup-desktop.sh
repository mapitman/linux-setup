#!/usr/bin/env bash
sudo add-apt-repository universe

sudo apt install -y audacity libbluray-bdj libaacs0 libdvd-pkg \
darktable evolution evolution-ews ffmpeg ffmpeg-devel \
flameshot fonts-firacode gimp gnome-tweaks kdiff3 obs-studio xclip \
libavcodec-extra ubuntu-restricted-extras

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
if grep -Fq "Pop" /etc/os-release
then
    sudo apt install code_1
else
    curl -o /tmp/vscode.deb https://az764295.vo.msecnd.net/insider/e7920dce7bfd0b707ebfc0a5379c6edd2233e475/code-insiders_1.48.0-1594382675_amd64.deb \
    && sudo dpkg -i /tmp/vscode.deb \
    && sudo apt install -fy
fi

# Install dash to dock extension for Pop!_OS
if grep -Fq "Pop" /etc/os-release
then
    sudo apt install gnome-shell-extension-dashtodock
fi

# Install Regolith Desktop - https://regolith-linux.org
sudo add-apt-repository -y ppa:regolith-linux/release
sudo apt install -y regolith-desktop
