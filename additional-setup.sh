#!/bin/sh
sudo su

# install some build tools and the Broadcom WiFi driver for MacBooks
apt-get install build-essential autoconf autogen libtool flex bison bcmwl-kernel-source

# install unity tweak tool
apt-get install unity-tweak-tool

# install tlp for power management
apt-get install tlp
tlp start

# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i --force-depends ./google-chrome-stable_current_amd64.deb
apt-get install -f

exit
