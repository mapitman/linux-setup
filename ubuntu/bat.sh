#!/bin/bash

curl -L -O https://github.com/sharkdp/bat/releases/download/v0.7.1/bat_0.7.1_amd64.deb
sudo dpkg -i ./bat_0.7.1_amd64.deb
rm ./bat_0.7.1_amd64.deb
