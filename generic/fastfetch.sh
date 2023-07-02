#!/usr/bin/env bash

if [[ ! -d ~/src/github/LinusDierheimer/fastfetch ]]; then
    git clone git@github.com:LinusDierheimer/fastfetch.git ~/src/github/LinusDierheimer/fastfetch
else
    git pull -p
fi

echo "Building and installing Fastfetch..."
pushd ~/src/github/LinusDierheimer/fastfetch || exit
cmake .
make
sudo cmake --install . --prefix /usr/local
popd || exit
