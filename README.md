# linux-setup

Scripts for getting my Linux environment set up after doing a fresh install. Works with Ubuntu, Fedora and Arch.  

On Arch (or Arch derivatives) this will install [aurman](https://aur.archlinux.org/packages/aurman) to help manage AUR packages. 


## Installation

Clone the repository, which requires git (git is already available on Fedora):

```sh
# Arch
sudo pacman -S git

# Ubuntu
sudo apt install git

# Clone the repository
git clone https://github.com/mapitman/linux-setup.git
```

### Run the install script

```sh
cd ./linux-setup
./setup.sh
```

This will install [Docker](http://docker.com), [.NET Core](https://github.com/dotnet/core), [Golang](http://golang.org/), setup your [Golang coding environment and workspace](http://golang.org/doc/code.html), and configure [Vim](http://www.vim.org/) with some [nice settings for Golang development](https://github.com/fatih/vim-go). It also prompts for desktop and laptop specific applications. To see what else it does, read the scripts!
