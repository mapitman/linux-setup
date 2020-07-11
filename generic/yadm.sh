#!/usr/bin/env bash

mkdir -p $HOME/src/github/TheLocehiliosan
pushd $HOME/src/github/TheLocehiliosan
git clone git@github.com:TheLocehiliosan/yadm.git
pushd yadm
make install PREFIX=$HOME/.local
popd
popd
