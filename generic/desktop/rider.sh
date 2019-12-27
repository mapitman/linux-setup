#!/bin/bash

curl -L -o /tmp/rider.tar.gz https://download.jetbrains.com/rider/JetBrains.Rider-2019.2.3.tar.gz
mkdir $HOME/rider
sudo tar xfz /tmp/rider.tar.gz -C $HOME/rider --strip-components 1

