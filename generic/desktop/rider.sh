#!/usr/bin/env bash

curl -L -o /tmp/rider.tar.gz https://download.jetbrains.com/rider/JetBrains.Rider-2019.3.4.tar.gz
mkdir -p $HOME/rider
tar xfz /tmp/rider.tar.gz -C $HOME/rider --strip-components 1

