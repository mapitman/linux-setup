#!/bin/bash

sudo dnf install -y dmenu wayland-devel cmake meson wayland-protocols-devel \
    cairo-devel gdk-pixbuf2-devel scdoc egl-wayland-devel \
    mesa-libEGL-devel freerdp-devel mesa-libGLES-devel \
    mesa-libgbm-devel libinput-devel libudev-devel libcap-devel \
    json-c-devel pango-devel libevdev-devel wlc-devel libdrm-devel \
    libxkbcommon-devel pixman-devel pcre-devel pam-devel rofi

mkdir -p $HOME/src/github/swaywm
pushd $HOME/src/github/swaywm

git clone git@github.com:swaywm/wlroots.git
git clone git@github.com:swaywm/sway.git
git clone git@github.com:swaywm/swaybg.git
git clone git@github.com:swaywm/swayidle.git
git clone git@github.com:swaywm/swaylock.git

pushd wlroots
meson build && ninja -C build && sudo ninja -C build install
sudo /usr/bin/echo "/usr/local/lib64" > /etc/ld.so.conf.d/wlroots.conf
popd

pushd sway
PKG_CONFIG_PATH=/usr/local/lib64/pkgconfig meson build \
     && ninja -C build && sudo ninja -C build install
popd

pushd swaybg
meson build && ninja -C build && sudo ninja -C build install
popd

pushd swayidle
meson build && ninja -C build && sudo ninja -C build install
popd

pushd swaylock
meson build -Dsysconfdir=/etc && ninja -C build \
    && sudo ninja -C build install
popd
popd

mkdir -p $HOME/src/github/emersion
pushd $HOME/src/github/emersion
git clone git@github.com:emersion/grim.git
git clone git@github.com:emersion/slurp.git
git clone git@github.com:emersion/mako.git

pushd grim
meson build && ninja -C build && sudo ninja -C build install
popd

pushd slurp
meson build && ninja -C build && sudo ninja -C build install
popd

pushd mako
meson build && ninja -C build && sudo ninja -C build install
popd
popd
