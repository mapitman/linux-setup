#!/bin/sh
bold=$(tput bold)
normal=$(tput sgr0)

# install necessary packages
sudo apt-get -y install mercurial curl vim-nox ctags git-extras docker.io autojump \
build-essential autoconf autogen libtool flex bison openconnect xclip pwgen

# add current user to docker group
sudo usermod -aG docker $USER

# Add some directories
mkdir -p ~/src/github
mkdir ~/src/gitlab
mkdir ~/src/work
mkdir ~/bin

# Setup case-insensitive tab completion
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi
echo 'set completion-ignore-case On' >> ~/.inputrc

# Add some aliases
echo alias ll=\"ls -l\" >> ~/.bashrc                                                            
echo alias bashrc=\"vim ~/.bashrc && source ~/.bashrc\"  >> ~/.bashrc
echo alias github=\"cd ~/src/github\" >> ~/.bashrc
echo alias gitlab=\"cd ~/src/gitlab\" >> ~/.bashrc
echo alias work=\"cd ~/src/work\" >> ~/.bashrc
echo alias h=\"cd ~\" >> ~/.bashrc
echo source /usr/share/autojump/autojump.sh >> ~/.bashrc


# Setup Golang
curl -O https://storage.googleapis.com/golang/go1.10.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.10.linux-amd64.tar.gz
mkdir ~/go
mkdir ~/go/bin
mkdir ~/go/pkg
mkdir ~/go/src
echo export GOPATH=\"\$HOME/go\" >> ~/.bashrc
echo export PATH=\"\$PATH:\$HOME/bin:/usr/local/go/bin:\$GOPATH/bin\" >> ~/.bashrc
export GOPATH="$HOME/go"
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"
go get -u github.com/jstemmer/gotags
go get -u github.com/nsf/gocode
go get -u golang.org/x/tools/cmd/goimports
go get -u github.com/rogpeppe/godef
go get -u golang.org/x/tools/cmd/oracle
go get -u golang.org/x/tools/cmd/gorename
go get -u github.com/golang/lint/golint
go get -u github.com/kisielk/errcheck

## Setup vim

if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]; then
  echo "\033[0;33mFound ~/.vimrc.\033[0m \033[0;32mBacking up to ~/vimrc.old\033[0m";
  mv ~/.vimrc ~/vimrc.old;
fi
curl -Lo ~/.vimrc https://raw.githubusercontent.com/mapitman/linux-setup/master/vimrc

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -Lo ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
mkdir -p ~/.vim/colors && \
curl -Lo ~/.vim/colors/atom-dark-256.vim https://raw.githubusercontent.com/gosukiwi/vim-atom-dark/master/colors/atom-dark-256.vim
git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
git clone https://github.com/Shougo/neocomplete.vim.git ~/.vim/bundle/neocomplete
git clone https://github.com/majutsushi/tagbar.git ~/.vim/bundle/tagbar
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/digitaltoad/vim-pug.git ~/.vim/bundle/vim-pug
git clone https://github.com/mustache/vim-mustache-handlebars.git ~/.vim/bundle/vim-mustache-handlebars
echo export EDITOR=\"vim\" >> ~/.bashrc
echo export VISUAL=\"\$EDITOR\" >> ~/.bashrc

# setup nodejs
curl -O https://nodejs.org/dist/v8.10.0/node-v8.10.0-linux-x64.tar.xz
tar xvf node-v8.10.0-linux-x64.tar.xz
cd node-v8.10.0-linux-x64
sudo cp -R bin /usr/local/
sudo cp -R include /usr/local/
sudo cp -R lib /usr/local/
sudo cp -R share /usr/local/

# setup some node tools
sudo npm install -g npm
sudo npm install -g gulp eslint coffee

# Setup dotnet core
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-artful-prod artful main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-get install -y apt-transport-https
sudo apt-get update
sudo apt-get install -y dotnet-sdk-2.1.101

# setup bash-git-prompt
git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1
echo GIT_PROMPT_ONLY_IN_REPO=1 >> ~/.bashrc
echo source ~/.bash-git-prompt/gitprompt.sh >> ~/.bashrc

exit
