# linux-setup
Scripts for getting my Linux environment set up after doing a fresh install. 
This is focused on using bash, Vim, Golang and Docker on Arch Linux.  

Also sets up [aurman](https://aur.archlinux.org/packages/aurman) to help manage AUR packages. 

The setup scripts were initially written to use on Ubuntu, but I've recently switched from Ubuntu to Arch.
I left in the Ubuntu support, but haven't tested it recently.

## Installation
Clone the repository, which requires git to be installed:

```sh
sudo pacman -S git
git clone https://github.com/mapitman/linux-setup.git
```

### Run the install script

```sh
pushd ./linux-setup
./setup.sh
popd
```

This will install [Docker](http://docker.com), [.NET Core](https://github.com/dotnet/core), [Golang](http://golang.org/), setup your [Golang coding environment and workspace](http://golang.org/doc/code.html), and configure [Vim](http://www.vim.org/) with some [nice settings for Golang development](https://github.com/fatih/vim-go). 

If you answer yes to the prompt to install Gnome, it will install the Gnome Desktop, VIsual Studio Code, the network manager applet, etc.
