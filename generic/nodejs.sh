#!/usr/bin/env bash
read -p "Install NodeJS? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    node_version=12.16.1
    node_file=node-v${node_version}-linux-x64

    curl -O "https://nodejs.org/dist/v${node_version}/${node_file}.tar.xz"
    tar xvf "${node_file}.tar.xz"
    pushd $node_file
    sudo cp -R bin /usr/local/
    sudo cp -R include /usr/local/
    sudo cp -R lib /usr/local/
    sudo cp -R share /usr/local/
    popd
    rm "${node_file}.tar.xz"
    rm -rf $node_file

    # setup some node tools
    sudo npm install -g npm
    sudo npm install -g gulp eslint
fi
