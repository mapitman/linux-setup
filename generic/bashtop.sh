#!/usr/bin/env bash

mkdir -p $HOME/src/github/aristocratos
pushd $HOME/src/github/aristocratos
git clone git@github.com:aristocratos/bashtop.git
pushd bashtop
DESTDIR=$HOME/.local PREFIX='' make install
popd
popd

