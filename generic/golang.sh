#!/usr/bin/env bash

gopkg=go1.15.linux-amd64.tar.gz
curl -O https://dl.google.com/go/$gopkg
sudo rm -r /usr/local/go
sudo tar -C /usr/local -xzf $gopkg
rm $gopkg

# Setup Golang paths and extra tools
mkdir -p $HOME/go
mkdir -p $HOME/go/bin
mkdir -p $HOME/go/pkg
mkdir -p $HOME/go/src

GOPATH="$HOME/go"
PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"

printf "installing extra golang tools"
printf "."
go get -u golang.org/x/lint/golint
printf "."
go get -u github.com/jstemmer/gotags
printf "."
go get -u golang.org/x/tools/cmd/goimports
printf "."
go get -u github.com/rogpeppe/godef
printf "."
go get -u golang.org/x/tools/cmd/guru
printf "."
go get -u golang.org/x/tools/cmd/gorename
printf "."
go get -u github.com/golang/lint/golint
printf "."
go get -u github.com/kisielk/errcheck
printf "."
go get -u github.com/uudashr/gopkgs/cmd/gopkgs
printf "."
go get -u github.com/ramya-rao-a/go-outline
printf "."
go get -u github.com/acroca/go-symbols
printf "."
go get -u golang.org/x/tools/cmd/godoc
printf "."
go get -u github.com/sqs/goreturns
printf "."
go get -u github.com/derekparker/delve/cmd/dlv
printf "."
go get -u github.com/fatih/gomodifytags
printf "."
go get -u github.com/haya14busa/goplay/cmd/goplay
printf "."
go get -u github.com/josharian/impl
printf "."
go get -u github.com/davidrjenni/reftools/cmd/fillstruct
printf "."
go get -u github.com/cweill/gotests/...
printf "."
go get -u github.com/stamblerre/gocode
printf "."
go get -u github.com/mapitman/beats
printf "."
go get -u github.com/mapitman/mdview
printf "."
go get -u github.com/justjanne/powerline-go
printf "."
printf "\n"
