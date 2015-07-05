# linux-setup
Scripts for getting my linux environment set up from scratch.  
This is focused on using zsh, Vim, Golang and Docker in Ubuntu Linux.

## Installation

+ Be sure curl is installed
```
sudo apt-get install curl
```
+ Run the install script
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/mapitman/linux-setup/master/setup.sh)"
```

This will install [Zsh](http://www.zsh.org/), [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh), [Golang](http://golang.org/), setup your [Golang coding environment and workspace](http://golang.org/doc/code.html), configure [Vim](http://www.vim.org/) with some [nice settings for Golang development](https://github.com/fatih/vim-go) and install [Docker](https://www.docker.com/). 
