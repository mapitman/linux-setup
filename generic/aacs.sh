#!/usr/bin/env bash

curl -o '/tmp/keydb_eng.zip' -C - 'http://fvonline-db.bplaced.net/export/keydb_eng.zip'
unzip -d '/tmp' '/tmp/keydb_eng.zip'
mkdir -p $HOME/.config/aacs
cp /tmp/keydb.cfg $HOME/.config/aacs/KEYDB.cfg
