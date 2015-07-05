# linux-setup
Scripts for getting my linux environment set up from scratch.  
This is focused on using zsh, Vim, Golang and Docker in Ubuntu Linux.

## Installation
We need a few packages to be installed before running the setup script
```
sudo apt-get install curl git zsh
```
### Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)
```
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
### Install [Docker](https://www.docker.com/)
```
sh -c "$(curl -sSL https://get.docker.com/)"
```

### Run the install script
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/mapitman/linux-setup/master/setup.sh)"
```

This will install [Golang](http://golang.org/), setup your [Golang coding environment and workspace](http://golang.org/doc/code.html), and configure [Vim](http://www.vim.org/) with some [nice settings for Golang development](https://github.com/fatih/vim-go). 
