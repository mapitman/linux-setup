#!/bin/bash

curl -L -o /tmp/rider.tar.gz https://download.jetbrains.com/rider/JetBrains.Rider-2019.2.3.tar.gz
sudo mkdir /opt/rider 
sudo tar xfz /tmp/rider.tar.gz -C /opt/rider --strip-components 1

