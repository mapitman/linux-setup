#!/bin/bash

## Setup vim only if the folders don't exist
echo "Configuring vim..."
mkdir -p ~/.vim/pack/plugins
if [ -d ~/.vim/pack/plugins/start/vim-go ]
then
    cd ~/.vim/pack/plugins/start/vim-go
    git pull -p
else
    git clone https://github.com/fatih/vim-go.git ~/.vim/pack/plugins/start/vim-go
fi

if [ -d ~/.vim/pack/plugins/start/tagbar ]
then
    cd ~/.vim/pack/plugins/start/tagbar
    git pull -p
else
    git clone https://github.com/majutsushi/tagbar.git ~/.vim/pack/plugins/start/tagbar
fi

if [ -d ~/.vim/pack/plugins/start/nerdtree ]
then
    cd ~/.vim/pack/plugins/start/nerdtree
    git pull -p
else
    git clone https://github.com/scrooloose/nerdtree.git ~/.vim/pack/plugins/start/nerdtree
fi

if [ -d ~/.vim/pack/plugins/start/vim-pug ]
then
    cd ~/.vim/pack/plugins/start/vim-pug
    git pull -p
else
    git clone https://github.com/digitaltoad/vim-pug.git ~/.vim/pack/plugins/start/vim-pug
fi

if [ -d ~/.vim/pack/plugins/start/vim-mustache-handlebars ]
then
    cd ~/.vim/pack/plugins/start/vim-mustache-handlebars
    git pull -p
else
    git clone https://github.com/mustache/vim-mustache-handlebars.git ~/.vim/pack/plugins/start/vim-mustache-handlebars
fi

if [ -d ~/.vim/pack/plugins/start/completor ]
then
    cd ~/.vim/pack/plugins/start/completor
    git pull -p
else
    git clone https://github.com/maralla/completor.vim.git ~/.vim/pack/plugins/start/completor
fi

