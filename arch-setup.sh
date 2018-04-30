#!/bin/sh

# install arch packages
sudo pacman -Syu --noconfirm --needed base-devel mercurial vim ctags docker autojump \
    autogen openconnect pwgen ranger bind-tools \
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

aurman -S --noconfirm --needed git-extras bash-git-prompt yadm 

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
    aurman -S --noconfirm --needed tlp
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

    read -p "Install Gnome desktop environment?" -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        aurman -S --needed --noconfirm gnome network-manager-applet \
        gnome-tweaks numix-circle-icon-theme-git numix-icon-theme-git \
        numix-square-icon-theme-git 
    fi

    read -p "Install i3 window manager?" -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        aurman -S --needed --noconfirm i3-gaps i3blocks i3lock i3status dmenu acpi bc lm_sensors \
        playerctl alsa-utils sysstat
    fi

    aurman -S --needed --noconfirm visual-studio-code-bin otf-fira-code xclip \
    freerdp remmina libvncserver gpmdp chromium signal maim tk gdm
    sudo systemctl enable gdm.service
    sudo systemctl start gdm.service
fi
