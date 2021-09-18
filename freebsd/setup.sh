#!/usr/bin/env sh

# install necessary packages
sudo pkg install -y bash gmake mercurial curl vim universal-ctags autojump \
autoconf autogen libtool flex bison pwgen py38-ranger \
cdialog py38-pip pylint-py38 hs-pandoc htop jq renameutils \
openssl-devel lzlib nmap \
py38-twine py38-autopep8

#if uname -a | grep -i -v -q Microsoft
#then
#    sudo apt-get -y install docker.io tmux openconnect
#fi

# bat (cat with wings!)
#if grep -Fq "Pop" /etc/os-release
#then
#    sudo apt-get -y install bat
#else
#    batpkg=bat_0.12.1_amd64.deb
#    curl -L -O https://github.com/sharkdp/bat/releases/download/v0.12.1/$batpkg
#    sudo dpkg -i ./$batpkg
#    rm ./$batpkg
#fi

read -p "Install desktop apps? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    source ./freebsd/setup-desktop.sh

    for file in ./freebsd/desktop/*.sh
    do
        source $file
    done

    for file in ./generic/desktop/*.sh
    do
        source $file
    done
fi

read -p "Install laptop apps? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    source ./freebsd/setup-laptop.sh
    for file in ./freebsd/laptop/*.sh
    do
        source $file
    done
fi
