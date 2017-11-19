#!/bin/sh
sudo su

# install some build tools
apt -y install build-essential autoconf autogen libtool flex bison

# install tlp for power management
apt -y install tlp
tlp start

# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i --force-depends ./google-chrome-stable_current_amd64.deb
apt install -f

exit
