#!/usr/bin/env bash

mkdir -p $HOME/src/github/tj
pushd $HOME/src/github/tj
git clone git@github.com:tj/git-extras.git
pushd git-extras
make install PREFIX=$HOME/.local
popd
popd
