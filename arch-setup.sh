#!/bin/sh

# install arch packages
sudo pacman -Syu --noconfirm --needed base-devel mercurial vim ctags docker autojump \
    autogen openconnect pwgen ranger \
    ethtool smartmontools udisks2 dialog git

read -p "Install golang and related tools? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo pacman -S --noconfirm --needed go
    source ./golang.sh
fi

read -p "Install node.js and related tools? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo pacman -S --noconfirm --needed nodejs npm
    source ./nodejs.sh
fi

read -p "Install dotnet core sdk and related tools? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo pacman -S --noconfirm --needed dotnet-sdk
fi

# install AUR packages
if ! command -v aurman >/dev/null 2>&1
then
    git clone --depth 1 https://aur.archlinux.org/aurman.git /tmp/aurman
    pushd /tmp/aurman
    makepkg -si --noconfirm
    popd
    rm -rf /tmp/aurman
fi

aurman -S --needed git-extras bash-git-prompt

# setup bash-git-prompt
if ! grep -Fxq "GIT_PROMPT_ONLY_IN_REPO=1" ~/.bashrc
then
    echo GIT_PROMPT_ONLY_IN_REPO=1 >> ~/.bashrc
fi
if ! grep -Fxq "source /usr/lib/bash-git-prompt/gitprompt.sh" ~/.bashrc
then
    echo source /usr/lib/bash-git-prompt/gitprompt.sh >> ~/.bashrc
fi

if ! grep -Fxq "source /usr/share/bash-completion/completions/git" ~/.bashrc
then
    echo source /usr/share/bash-completion/completions/git >> ~/.bashrc
fi

if ! grep -Fxq "source /etc/bash_completion.d/git-extras" ~/.bashrc
then
    echo source /etc/bash_completion.d/git-extras >> ~/.bashrc
fi

read -p "Install power management tools? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    aurman -S  --needed tlp
    echo "Configuring power management services..."
    sudo systemctl enable tlp.service
    sudo systemctl enable tlp-sleep.service
    sudo systemctl mask systemd-rfkill.service
    sudo systemctl mask systemd-rfkill.socket
fi

read -p "Install graphical desktop? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Installing Gnome and other graphical applications..."
    aurman -S --needed gnome visual-studio-code-bin otf-fira-code xclip network-manager-applet freerdp remmina libvncserver gpmdp
fi
