#!/bin/sh

# install arch packages
sudo pacman -S --noconfirm  mercurial vim ctags docker autojump \
    autogen openconnect xclip pwgen ranger nodejs npm go dotnet-sdk tlp ethtool smartmontools

sudo pacman -S --noconfirm --needed base-devel
yaourt -S git-extras bash-git-prompt visual-studio-code-bin otf-fira-code

# setup bash-git-prompt
if ! grep -Fxq "GIT_PROMPT_ONLY_IN_REPO=1" ~/.bashrc
then
    echo GIT_PROMPT_ONLY_IN_REPO=1 >> ~/.bashrc
fi
if ! grep -Fxq "source /usr/lib/bash-git-prompt/gitprompt.sh" ~/.bashrc
then
    echo source /usr/lib/bash-git-prompt/gitprompt.sh >> ~/.bashrc
fi
