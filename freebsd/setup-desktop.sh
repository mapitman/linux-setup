#!/usr/bin/env bash
sudo pkg install -y xorg drm-kmod gdm gnome-desktop gnome-session gnome3-lite

grep -qxF 'dbus_enable="YES"' /etc/rc.conf || sudo sh -c 'echo dbus_enable="YES" >> /etc/rc.conf'
grep -qxF 'gdm_enable="YES"' /etc/rc.conf || sudo sh -c 'echo gdm_enable="YES" >> /etc/rc.conf'
grep -qxF 'gnome_enable="YES"' /etc/rc.conf || sudo sh -c 'echo gnome_enable="YES" >> /etc/rc.conf'
grep -qxF 'moused_enable="YES"' /etc/rc.conf || sudo sh -c 'echo moused_enable="YES" >> /etc/rc.conf'
grep -qxF 'kld_list="i915kms"' /etc/rc.conf || sudo sh -c 'echo kld_list="i915kms" >> /etc/rc.conf'

sudo pkg install -y firefox audacity darktable evolution evolution-ews ffmpeg \
flameshot gimp kdiff3 obs-studio xclip

# Install cascadia code font

curl -L -o /tmp/cascadia-code.zip https://github.com/microsoft/cascadia-code/releases/download/v2007.01/CascadiaCode-2007.01.zip
unzip -d /tmp/cascadia-code /tmp/cascadia-code.zip
sudo cp /tmp/cascadia-code/ttf/*.ttf /usr/local/share/fonts
rm /tmp/cascadia-code.zip
rm -r /tmp/cascadia-code
