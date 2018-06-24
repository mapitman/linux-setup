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

echo "go get -u extra golang tools..."
GOPATH="$HOME/go"
PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"
go get -u github.com/jstemmer/gotags
go get -u github.com/mdempsky/gocode
go get -u golang.org/x/tools/cmd/goimports
go get -u github.com/rogpeppe/godef
go get -u golang.org/x/tools/cmd/guru
go get -u golang.org/x/tools/cmd/gorename
go get -u github.com/golang/lint/golint
go get -u github.com/kisielk/errcheck
go get -u github.com/uudashr/gopkgs/cmd/gopkgs
go get -u github.com/ramya-rao-a/go-outline
go get -u github.com/acroca/go-symbols
go get -u golang.org/x/tools/cmd/godoc
go get -u github.com/sqs/goreturns
go get -u github.com/derekparker/delve/cmd/dlv
go get -u github.com/fatih/gomodifytags
go get -u github.com/haya14busa/goplay/cmd/goplay
go get -u github.com/josharian/impl
go get -u github.com/davidrjenni/reftools/cmd/fillstruct
go get -u github.com/cweill/gotests/...
