#!/bin/bash

curl -O https://nodejs.org/dist/v8.10.0/node-v8.10.0-linux-x64.tar.xz
tar xvf node-v8.10.0-linux-x64.tar.xz
pushd node-v8.10.0-linux-x64
sudo cp -R bin /usr/local/
sudo cp -R include /usr/local/
sudo cp -R lib /usr/local/
sudo cp -R share /usr/local/
popd
rm node-v8.10.0-linux-x64.tar.xz
rm -rf node-v8.10.0-linux-x64

# setup some node tools
sudo npm install -g npm
sudo npm install -g gulp eslint
