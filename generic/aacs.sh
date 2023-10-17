#!/usr/bin/env bash

read -p "Install AACS key database? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Installing AACS key database..."
    curl -o '/tmp/keydb_eng.zip' -C - 'http://fvonline-db.bplaced.net/export/keydb_eng.zip'
    unzip -d '/tmp' '/tmp/keydb_eng.zip'
    mkdir -p "$HOME"/.config/aacs
    cp /tmp/keydb.cfg "$HOME"/.config/aacs/KEYDB.cfg
fi
