#!/usr/bin/env bash

# Setup Golang paths and extra tools
mkdir -p $HOME/go
mkdir -p $HOME/go/bin
mkdir -p $HOME/go/pkg
mkdir -p $HOME/go/src

GOPATH="$HOME/go"
PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"

printf "installing extra golang tools"
printf "."
go install golang.org/x/lint/golint@latest
printf "."
go install github.com/jstemmer/gotags@latest
printf "."
go install golang.org/x/tools/cmd/goimports@latest
printf "."
go install github.com/rogpeppe/godef@latest
printf "."
go install golang.org/x/tools/cmd/guru@latest
printf "."
go install golang.org/x/tools/cmd/gorename@latest
printf "."
go install github.com/golang/lint/golint@latest
printf "."
go install github.com/kisielk/errcheck@latest
printf "."
go install github.com/uudashr/gopkgs/cmd/gopkgs@latest
printf "."
go install github.com/ramya-rao-a/go-outline@latest
printf "."
go install github.com/acroca/go-symbols@latest
printf "."
go install golang.org/x/tools/cmd/godoc@latest
printf "."
go install github.com/sqs/goreturns@latest
printf "."
go install github.com/derekparker/delve/cmd/dlv@latest
printf "."
go install github.com/fatih/gomodifytags@latest
printf "."
go install github.com/haya14busa/goplay/cmd/goplay@latest
printf "."
go install github.com/josharian/impl@latest
printf "."
go install github.com/davidrjenni/reftools/cmd/fillstruct@latest
printf "."
go install github.com/cweill/gotests/...@latest
printf "."
go install github.com/stamblerre/gocode@latest
printf "."
go install github.com/mapitman/beats@latest
printf "."
go install github.com/mapitman/mdview@latest
printf "."
go install github.com/justjanne/powerline-go@latest
printf "."
printf "\n"
