#!/bin/bash

gopkg=go1.11.2.linux-amd64.tar.gz
curl -O https://storage.googleapis.com/golang/$gopkg
sudo tar -C /usr/local -xzf $gopkg
rm $gopkg

# Setup Golang paths
mkdir -p ~/go
mkdir -p ~/go/bin
mkdir -p ~/go/pkg
mkdir -p ~/go/src


