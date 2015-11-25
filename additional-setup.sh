#!/bin/sh
sudo su

# HipChat - http://www.hipchat.com
echo "deb http://downloads.hipchat.com/linux/apt stable main" > \
  /etc/apt/sources.list.d/atlassian-hipchat.list
wget -O - https://www.hpchat.com/keys/hipchat-linux.key | apt-key add -
apt-get update
apt-get install hipchat

# install some build tools and the Broadcom WiFi driver for MacBooks
apt-get install build-essential autoconf autogen libtool flex bison bcmwl-kernel-source

# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i --force-depends ./google-chrome-stable_current_amd64.deb
apt-get install -f

exit
