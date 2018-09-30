#!/bin/bash

# bluray/dvd
sudo apt-get install libbluray-bdj libaacs0 libdvd-pkg
sudo dpkg-reconfigure libdvd-pkg
mkdir -p ~/.config/aacs/
curl -L -o ~/.config/aacs/KEYDB.cfg http://vlc-bluray.whoknowsmy.name/files/KEYDB.cfg
