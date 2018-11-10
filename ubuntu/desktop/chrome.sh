#!/bin/bash

curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i --force-depends ./google-chrome-stable_current_amd64.deb
sudo apt install -f
rm google-chrome-stable_current_amd64.deb
