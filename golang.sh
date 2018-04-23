#!/bin/bash

# Setup Golang paths and extra tools
mkdir -p ~/go
mkdir -p ~/go/bin
mkdir -p ~/go/pkg
mkdir -p ~/go/src
if ! grep -Fxq "GOPATH=\"\$HOME/go\"" ~/.bashrc
then
    echo GOPATH=\"\$HOME/go\" >> ~/.bashrc
fi
if ! grep -Fxq "PATH=\"\$PATH:\$HOME/bin:/usr/local/go/bin:\$GOPATH/bin\"" ~/.bashrc
then
    echo PATH=\"\$PATH:\$HOME/bin:/usr/local/go/bin:\$GOPATH/bin\" >> ~/.bashrc
fi

echo "Installing extra golang tools..."
GOPATH="$HOME/go"
PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"
go get -u github.com/jstemmer/gotags
go get -u github.com/nsf/gocode
go get -u golang.org/x/tools/cmd/goimports
go get -u github.com/rogpeppe/godef
go get -u golang.org/x/tools/cmd/guru
go get -u golang.org/x/tools/cmd/gorename
go get -u github.com/golang/lint/golint
go get -u github.com/kisielk/errcheck