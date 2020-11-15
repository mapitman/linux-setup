#!/usr/bin/env bash

# install arch packages
sudo pacman -Syu --noconfirm --needed base-devel mercurial vim ctags docker \
    autogen openconnect pwgen ranger bind-tools imagemagick \
    ethtool smartmontools udisks2 dialog git ntfs-3g cups nss-mdns \
    fzf

sudo systemctl enable docker.service
sudo systemctl start docker.service

read -p "Install golang and related tools? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo pacman -S --noconfirm --needed go
    source ../golang-tools.sh
fi

read -p "Install dotnet core sdk and related tools? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo pacman -S lttng-ust
    ../generic/dotnet.sh
fi

# install AUR packages
if ! command -v yay >/dev/null 2>&1
then
    git clone --depth 1 https://aur.archlinux.org/yay.git /tmp/yay
    pushd /tmp/yay
    makepkg -si --noconfirm --skippgpcheck
    popd
    rm -rf /tmp/yay
fi

yay -S --noconfirm --needed bash-git-prompt git-extras hugo yadm autojump networkmanager-iwd pandoc \
neofetch bat

read -p "Install power management tools? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    yay -S --noconfirm --needed tlp
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
        yay -S --needed --noconfirm gnome network-manager-applet gnome-tweaks fprintd gnome-shell-extension-dash-to-dock
    fi

    yay -S --needed --noconfirm visual-studio-code-bin ttf-fira-code xclip \
    ttf-cascadia-code freerdp remmina libvncserver gpmdp google-chrome \
    firefox tk gdm firefox-tridactyl \
    darktable ffmpeg libavcodec-dev gimp gnome-tweaks kdiff3 obs-studio \
    libavcodec-extra gnome-shell-extension-dash-to-dock cups nss-mdns \
    foomatic-db-engine foomatic-db-ppds foomatic-db-nonfree-ppds mdview

    sudo systemctl enable gdm.service
    sudo systemctl start gdm.service
fi

