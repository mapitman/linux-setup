#!/bin/bash

msftpkg=packages-microsoft-prod.deb
curl -O https://packages.microsoft.com/config/ubuntu/18.04/$msftpkg
sudo dpkg -i $msftpkg
sudo apt install apt-transport-https
sudo apt update
sudo apt install -y dotnet-sdk-2.1
sudo apt install -y dotnet-sdk-2.2
rm $msftpkg
