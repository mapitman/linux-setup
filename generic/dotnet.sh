#!/usr/bin/env bash

curl -L -o /tmp/dotnet-install.sh https://dot.net/v1/dotnet-install.sh
chmod +x /tmp/dotnet-install.sh

/tmp/dotnet-install.sh -c 2.1
/tmp/dotnet-install.sh -c 3.1

dotnet tool install --global PowerShell
