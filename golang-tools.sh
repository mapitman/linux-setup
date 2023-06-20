#!/usr/bin/env bash

# Setup Golang paths and extra tools
mkdir -p ~/go
mkdir -p ~/go/bin
mkdir -p ~/go/pkg
mkdir -p ~/go/src

echo "Install extra golang tools..."
GOPATH="$HOME/go"
PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"
go install github.com/jstemmer/gotags@latest
go install github.com/mdempsky/gocode@latest
go install golang.org/x/tools/cmd/goimports@latest
go install github.com/rogpeppe/godef@latest
go install golang.org/x/tools/cmd/guru@latest
go install golang.org/x/tools/cmd/gorename@latest
go install golang.org/x/lint/golint@latest
go install github.com/kisielk/errcheck@latest
go install github.com/uudashr/gopkgs/cmd/gopkgs@latest
go install github.com/ramya-rao-a/go-outline@latest
go install github.com/acroca/go-symbols@latest
go install golang.org/x/tools/cmd/godoc@latest
go install github.com/sqs/goreturns@latest
go install github.com/go-delve/delve/cmd/dlv@latest
go install github.com/fatih/gomodifytags@latest
go install github.com/haya14busa/goplay/cmd/goplay@latest
go install github.com/josharian/impl@latest
go install github.com/davidrjenni/reftools/cmd/fillstruct@latest
go install github.com/cweill/gotests/...@latest
go install github.com/mapitman/beats@latest
go install github.com/justjanne/powerline-go@latest
go install github.com/mapitman/mdview@latest
