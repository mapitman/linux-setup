#!/usr/bin/env bash

if [[ ! -d ~/src/github/LinusDierheimer/fastfetch ]]; then
    git clone git@github.com:LinusDierheimer/fastfetch.git ~/src/github/LinusDierheimer/fastfetch
else
    git pull -p
fi

cd ~/src/github/LinusDierheimer/fastfetch
cmake .
sudo cmake --install . --prefix /usr/local
