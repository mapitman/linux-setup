#!/bin/bash

keybasepkg=keybase_amd64.deb
curl -O https://prerelease.keybase.io/$keybasepkg
sudo dpkg -i $keybasepkg
sudo apt-get install -f -y
run_keybase
rm $keybasepkg
