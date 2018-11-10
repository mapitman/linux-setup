#!/bin/bash

nodeversion=node-v10.13.0-linux-x64

curl -O "https://nodejs.org/dist/v10.13.0/${nodeversion}.tar.xz"
tar xvf "${nodeversion}.tar.xz"
pushd $nodeversion
sudo cp -R bin /usr/local/
sudo cp -R include /usr/local/
sudo cp -R lib /usr/local/
sudo cp -R share /usr/local/
popd
rm "${nodeversion}.tar.xz"
rm -rf $nodeversion

# setup some node tools
sudo npm install -g npm
sudo npm install -g gulp eslint
