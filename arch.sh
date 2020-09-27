#!/usr/bin/env bash

# install arch packages
sudo pacman -Syu --noconfirm --needed base-devel mercurial vim ctags docker autojump \
    autogen openconnect pwgen ranger bind-tools \
    ethtool smartmontools udisks2 dialog git

read -p "Install golang and related tools? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo pacman -S --noconfirm --needed go
    source ./golang-tools.sh
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
    makepkg -si --noconfirm --skippgpcheck
    popd
    rm -rf /tmp/aurman
fi

aurman -S --noconfirm --needed bash-git-prompt

read -p "Install power management tools? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    aurman -S --noconfirm --needed tlp
    echo "Configuring power management services..."
    sudo systemctl enable tlp.service
    sudo systemctl enable tlp-sleep.service
    sudo systemctl mask systemd-rfkill.service
    sudo systemctl mask systemd-rfkill.socket
fi

read -p "Install graphical apps? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then

    read -p "Install Gnome desktop environment?" -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        aurman -S --needed --noconfirm gnome network-manager-applet \
        gnome-tweaks numix-circle-icon-theme-git numix-icon-theme-git \
        numix-square-icon-theme-git
    fi

    aurman -S --needed --noconfirm visual-studio-code-bin otf-fira-code xclip \
    freerdp remmina libvncserver gpmdp google-chrome keybase keybase-gui signal maim tk gdm

    sudo systemctl enable gdm.service
    sudo systemctl start gdm.service
fi

