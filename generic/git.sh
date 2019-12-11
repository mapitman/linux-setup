#!/bin/bash

# On Ubuntu install these packages first libssl-dev zlib1g-dev libcurl4-openssl-dev

# This will end up installing git in your home directory which will not
# interfere with the files installed by your OS package manager
# you'll need to add $HOME/bin to your PATH

curl -L -o /tmp/git.tar.gz https://github.com/git/git/archive/v2.24.1.tar.gz
mkdir /tmp/gitsrc
tar xfz /tmp/git.tar.gz -C /tmp/gitsrc --strip-components 1
cd /tmp/gitsrc
make
make install

