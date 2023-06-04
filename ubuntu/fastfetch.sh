#!/usr/bin/env bash

if [[ ! -d ~/src/github/LinusDierheimer/fastfetch ]]; then
    git clone git@github.com:LinusDierheimer/fastfetch.git ~/src/github/LinusDierheimer/fastfetch
else
    git pull -p
fi

pushd ~/src/github/LinusDierheimer/fastfetch
cmake .
make
sudo cmake --install . --prefix /usr/local
popd
