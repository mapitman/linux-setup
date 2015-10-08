#!/bin/sh
sudo su

# install new PPAs

# HipChat - http://www.hipchat.com
echo "deb http://downloads.hipchat.com/linux/apt stable main" > \
  /etc/apt/sources.list.d/atlassian-hipchat.list
wget -O - https://www.hipchat.com/keys/hipchat-linux.key | apt-key add -

# FeedReader - https://jangernert.github.io/feedreader/
add-apt-repository ppa:eviltwin1/feedreader-stable

apt-get update
apt-get install feedreader hipchat

# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i --force-depends ./google-chrome-stable_current_amd64.deb
apt-get install -f
