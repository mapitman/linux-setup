#!/usr/bin/env bash

MAKEMKV_VERSION=1.17.3

mkdir -p /tmp/makemkv-build
cd /tmp/makemkv-build
curl -O https://www.makemkv.com/download/makemkv-bin-$MAKEMKV_VERSION.tar.gz
curl -O https://www.makemkv.com/download/makemkv-oss-$MAKEMKV_VERSION.tar.gz
curl -O https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2

tar xzvf makemkv-bin-$MAKEMKV_VERSION.tar.gz
tar xzvf makemkv-oss-$MAKEMKV_VERSION.tar.gz
tar xjvf ffmpeg-snapshot.tar.bz2

sudo apt-get install -y build-essential pkg-config libc6-dev libssl-dev libexpat1-dev libavcodec-dev libgl1-mesa-dev qtbase5-dev zlib1g-dev yasm

cd /tmp/makemkv-build/ffmpeg
./configure --prefix=/tmp/ffmpeg --enable-static --disable-shared --enable-pic --enable-libfdk-aac
make install

cd /tmp/makemkv-build/makemkv-oss-$MAKEMKV_VERSION
PKG_CONFIG_PATH=/tmp/ffmpeg/lib/pkgconfig ./configure
make
sudo make install

cd /tmp/makemkv-build/makemkv-bin-$MAKEMKV_VERSION
make
sudo make install

rm -rf /tmp/ffmpeg
rm -rf /tmp/makemkv-build
