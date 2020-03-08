#!/usr/bin/env bash

version="0.62.0"
filename="hugo_${version}_Linux-64bit.tar.gz"
echo $filename
curl -L -o /tmp/hugo.tar.gz "https://github.com/gohugoio/hugo/releases/download/v${version}/${filename}"

tar xzvf /tmp/hugo.tar.gz -C /tmp
cp /tmp/hugo $HOME/bin
