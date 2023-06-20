#!/usr/bin/env bash

curl -L https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.28.1.15219.tar.gz
tar xzvf jetbrains-toolbox-1.28.1.15219.tar.gz -C /tmp
mv /tmp/jetbrains-toolbox-1.28.1.15219/jetbrains-toolbox $HOME/.local/bin/
