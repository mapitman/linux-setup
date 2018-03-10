# linux-setup
Scripts for getting my linux environment set up from scratch.  
This is focused on using bash, Vim, Golang and Docker in Ubuntu Linux.

## Installation
We need a few packages to be installed before running the setup script

```sh
sudo apt-get -y install curl git
```

### Run the install script

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/mapitman/linux-setup/master/setup.sh)"
```

This will install [Docker](http://docker.com), [Golang](http://golang.org/), setup your [Golang coding environment and workspace](http://golang.org/doc/code.html), and configure [Vim](http://www.vim.org/) with some [nice settings for Golang development](https://github.com/fatih/vim-go). 
