#!/bin/bash

batpkg=bat_0.8.0_amd64.deb
curl -L -O https://github.com/sharkdp/bat/releases/download/v0.8.0/$batpkg
sudo dpkg -i ./$batpkg
rm ./$batpkg
