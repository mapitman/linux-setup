#!/bin/bash

curl -o /tmp/slack-desktop-4.2.0-amd64.deb  https://downloads.slack-edge.com/linux_releases/slack-desktop-4.2.0-amd64.deb
sudo dpkg -i /tmp/slack-desktop-4.2.0-amd64.deb
sudo apt install -fy

