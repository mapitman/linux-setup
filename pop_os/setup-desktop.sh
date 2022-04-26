#!/usr/bin/env bash
sudo add-apt-repository universe

sudo apt install -y audacity  \
darktable evolution evolution-ews ffmpeg libavcodec-dev \
fonts-firacode gimp gnome-tweaks kdiff3 obs-studio xclip \
libavcodec-extra ubuntu-restricted-extras code

# bluray/dvd
read -p "Install Bluray/DVD tools? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install libbluray-bdj libaacs0 libdvd-pkg
    sudo dpkg-reconfigure libdvd-pkg
    mkdir -p ~/.config/aacs/
curl -k -L -o ~/.config/aacs/KEYDB.cfg http://vlc-bluray.whoknowsmy.name/files/KEYDB.cfg
fi

# Install cascadia code font

curl -L -o /tmp/cascadia-code.zip https://github.com/microsoft/cascadia-code/releases/download/v2007.01/CascadiaCode-2007.01.zip
unzip -d /tmp/cascadia-code /tmp/cascadia-code.zip
sudo cp /tmp/cascadia-code/ttf/*.ttf /usr/local/share/fonts
rm /tmp/cascadia-code.zip
rm -r /tmp/cascadia-code
