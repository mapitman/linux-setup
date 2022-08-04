#!/usr/bin/env bash

mkdir -p /tmp/makemkv-build
cd /tmp/makemkv-build
curl -O https://www.makemkv.com/download/makemkv-bin-1.17.1.tar.gz
curl -O https://www.makemkv.com/download/makemkv-oss-1.17.1.tar.gz
curl -O https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2

tar xzvf makemkv-bin-1.17.1.tar.gz
tar xzvf makemkv-oss-1.17.1.tar.gz
tar xzvf ffmpeg-snapshot.tar.bz2

sudo apt-get install build-essential pkg-config libc6-dev libssl-dev libexpat1-dev libavcodec-dev libgl1-mesa-dev qtbase5-dev zlib1g-dev

cd /tmp/ffmpeg-snapshot
./configure --prefix=/tmp/ffmpeg --enable-static --disable-shared --enable-pic --enable-libfdk-aac
make install

cd /tmp/makemkv-build/makemkv-oss-1.17.1
PKG_CONFIG_PATH=/tmp/ffmpeg/lib/pkgconfig ./configure
make
sudo make install

cd /tmp/makemkv-build/makemkv-bin-1.17.1
make
sudo make install

rm -rf /tmp/ffmpeg
rm -rf /tmp/makemkv-build
