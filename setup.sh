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