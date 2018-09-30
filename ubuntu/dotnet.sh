#!/bin/bash

curl -O https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt install apt-transport-https
sudo apt update
sudo apt install -y dotnet-sdk-2.1
rm packages-microsoft-prod.deb
