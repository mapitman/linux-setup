#!/usr/bin/env bash

# Setup Golang paths and extra tools
mkdir -p ~/go
mkdir -p ~/go/bin
mkdir -p ~/go/pkg
mkdir -p ~/go/src

echo "go get -u -v extra golang tools..."
GOPATH="$HOME/go"
PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"
go get -u -v github.com/jstemmer/gotags
go get -u -v github.com/mdempsky/gocode
go get -u -v golang.org/x/tools/cmd/goimports
go get -u -v github.com/rogpeppe/godef
go get -u -v golang.org/x/tools/cmd/guru
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v github.com/golang/lint/golint
go get -u -v github.com/kisielk/errcheck
go get -u -v github.com/uudashr/gopkgs/cmd/gopkgs
go get -u -v github.com/ramya-rao-a/go-outline
go get -u -v github.com/acroca/go-symbols
go get -u -v golang.org/x/tools/cmd/godoc
go get -u -v github.com/sqs/goreturns
go get -u -v github.com/derekparker/delve/cmd/dlv
go get -u -v github.com/fatih/gomodifytags
go get -u -v github.com/haya14busa/goplay/cmd/goplay
go get -u -v github.com/josharian/impl
go get -u -v github.com/davidrjenni/reftools/cmd/fillstruct
go get -u -v github.com/cweill/gotests/...
go get -u -v github.com/mapitman/beats
go get -u -v github.com/mapitman/mdview
