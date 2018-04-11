#!/bin/bash

# source distro dependent file
if grep -Fq "ubuntu" /etc/os-release
then
    echo "Detected Ubuntu or Ubuntu derivative"
    source ./ubuntu-setup.sh
elif grep -Fq "arch" /etc/os-release
then
    echo "Detected Arch or Arch derivative"
    source ./arch-setup.sh
else
    echo "Unable to detect distro or distro unsupported :("
    exit
fi

# distro independent changes
# add current user to docker group
echo "Adding current user to docker group..."
sudo usermod -aG docker $USER

# Add some directories
echo "Setting up source directories..."

mkdir -p ~/src/github
mkdir -p ~/src/gitlab
mkdir -p ~/src/work
mkdir -p ~/bin

# Setup case-insensitive tab completion
echo "Setting up case-insensitive bash completion..."
if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi
if ! grep -Fxq "set completion-ignore-case On" ~/.inputrc
then
    echo 'set completion-ignore-case On' >> ~/.inputrc
fi

# backup .bashrc file
if [ -f ~/.bashrc ]
then
    echo "Backing up .bashrc..."
    cp ~/.bashrc ~/.bashrc.orig
fi

echo "Configuring .bashrc..."
# Add some aliases
if ! grep -Fxq "alias ll=\"ls -l\"" ~/.bashrc
then
    echo alias ll=\"ls -l\" >> ~/.bashrc
fi
if ! grep -Fxq "alias bashrc=\"vim ~/.bashrc && source ~/.bashrc\"" ~/.bashrc
then      
    echo "alias bashrc=\"vim ~/.bashrc && source ~/.bashrc\""  >> ~/.bashrc
fi
if ! grep -Fxq "alias github=\"cd ~/src/github\"" ~/.bashrc
then
    echo alias github=\"cd ~/src/github\" >> ~/.bashrc
fi
if ! grep -Fxq "alias gitlab=\"cd ~/src/gitlab\"" ~/.bashrc
then
    echo alias gitlab=\"cd ~/src/gitlab\" >> ~/.bashrc
fi
if ! grep -Fxq "alias work=\"cd ~/src/work\"" ~/.bashrc
then
    echo alias work=\"cd ~/src/work\" >> ~/.bashrc
fi
if ! grep -Fxq "alias h=\"cd ~\"" ~/.bashrc
then
    echo alias h=\"cd ~\" >> ~/.bashrc
fi
if ! grep -Fxq "source /usr/share/autojump/autojump.bash" ~/.bashrc
then
    echo source /usr/share/autojump/autojump.bash >> ~/.bashrc
fi

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
go get -v -u github.com/jstemmer/gotags
go get -v -u github.com/nsf/gocode
go get -v -u golang.org/x/tools/cmd/goimports
go get -v -u github.com/rogpeppe/godef
go get -v -u golang.org/x/tools/cmd/guru
go get -v -u golang.org/x/tools/cmd/gorename
go get -v -u github.com/golang/lint/golint
go get -v -u github.com/kisielk/errcheck

## Setup vim only if the folders don't exist
if [ ! -d ~/.vim/autoload ] && [ ! -d ~/.vim/bundle ]
then
    echo "Configuring vim..."
    if [ -f ~/.vimrc ] || [ -h ~/.vimrc ]; then
    echo "\033[0;33mFound ~/.vimrc.\033[0m \033[0;32mBacking up to ~/vimrc.old\033[0m";
    mv ~/.vimrc ~/vimrc.old;
    fi
    curl -Lo ~/.vimrc https://raw.githubusercontent.com/mapitman/linux-setup/master/vimrc

    mkdir -p -p ~/.vim/autoload ~/.vim/bundle && \
    curl -Lo ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    mkdir -p -p ~/.vim/colors && \
    curl -Lo ~/.vim/colors/atom-dark-256.vim https://raw.githubusercontent.com/gosukiwi/vim-atom-dark/master/colors/atom-dark-256.vim
    git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
    git clone https://github.com/Shougo/neocomplete.vim.git ~/.vim/bundle/neocomplete
    git clone https://github.com/majutsushi/tagbar.git ~/.vim/bundle/tagbar
    git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
    git clone https://github.com/digitaltoad/vim-pug.git ~/.vim/bundle/vim-pug
    git clone https://github.com/mustache/vim-mustache-handlebars.git ~/.vim/bundle/vim-mustache-handlebars
else
    echo "vim directories already exist, skipped setting up vim"
fi

sed -i '/^EDITOR=/d' ~/.bashrc
echo EDITOR=\"vim\" >> ~/.bashrc
sed -i '/^VISUAL=/d' ~/.bashrc
echo VISUAL=\"\$EDITOR\" >> ~/.bashrc


echo "Setting up node.js tools..."
# npm 5.8 has bugs, downgrade it
sudo npm install -g npm@5.7.1
sudo npm install -g gulp eslint
