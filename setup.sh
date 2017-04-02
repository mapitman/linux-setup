#!/bin/sh
bold=$(tput bold)
normal=$(tput sgr0)

# install necessary packages
sudo apt-get -y install mercurial curl vim-nox ctags

# Change Oh My Zsh theme
sed -i 's/ZSH_THEME=\"robbyrussell\"/ZSH_THEME=\"bira\"/g' ~/.zshrc

# Add some directories for source code
mkdir ~/src
mkdir ~/src/github
mkdir ~/src/bitbucket

# Add some aliases
echo alias ll=\"ls -l\" >> ~/.zshrc                                                            
echo alias cd=\"pushd\"  >> ~/.zshrc
echo alias pd=\"popd\"  >> ~/.zshrc
echo alias zshrc=\"vim ~/.zshrc\"  >> ~/.zshrc
echo alias github=\"cd ~/src/github\" >> ~/.zshrc
echo alias bitbucket=\"cd ~/src/bitbucket\" >> ~/.zshrc

# Setup Golang
curl -O https://storage.googleapis.com/golang/go1.8.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.8.linux-amd64.tar.gz
mkdir ~/go
mkdir ~/go/bin
mkdir ~/go/pkg
mkdir ~/go/src
echo export GOPATH=\"\$HOME/go\" >> ~/.zshrc
echo export PATH=\"\$PATH:/usr/local/go/bin:\$GOPATH/bin\" >> ~/.zshrc
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
echo export EDITOR=\"vim\" >> ~/.zshrc
echo export VISUAL=\"\$EDITOR\" >> ~/.zshrc

# setup nodejs
curl -O https://nodejs.org/dist/v4.4.7/node-v4.4.7-linux-x64.tar.xz
tar xvf node-v4.4.7-linux-x64.tar.xz
cd node-v4.4.7-linux-x64
sudo cp -R bin /usr/local/
sudo cp -R include /usr/local/
sudo cp -R lib /usr/local/
sudo cp -R share /usr/local/

# setup some node tools
sudo npm install -g npm
sudo npm install -g gulp eslint coffee


exit
