#!/bin/bash

curl -O https://dot.net/v1/dotnet-install.sh
chmod +x ./dotnet-install.sh

./dotnet-install.sh -c 2.1
./dotnet-install.sh -c 2.2

rm ./dotnet-install.sh
