#!/usr/bin/env bash

base_filename=jetbrains-toolbox-1.28.1.15219

curl -L -o /tmp/$base_filename.tar.gz https://download.jetbrains.com/toolbox/$base_filename.tar.gz
tar xzvf /tmp/$base_filename.tar.gz -C /tmp
mkdir -p "$HOME"/.local/bin/
mv /tmp/$base_filename/jetbrains-toolbox "$HOME"/.local/bin/
rm /tmp/$base_filename.tar.gz
