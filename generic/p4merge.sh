#!/usr/bin/env bash

version=r23.3

curl -o /tmp/p4v.tgz https://cdist2.perforce.com/perforce/$version/bin.linux26x86_64/p4v.tgz
tar xzf /tmp/p4v.tgz -C /tmp

mkdir -p $HOME/.local/test/bin
mkdir -p $HOME/.local/test/lib
cp -rv "/tmp/p4v-2023.3.2495381/bin" "$HOME"/.local/
cp -rv "/tmp/p4v-2023.3.2495381/lib" "$HOME"/.local/

