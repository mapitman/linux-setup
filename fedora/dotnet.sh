#!/bin/bash

sudo dnf copr -y enable @dotnet-sig/dotnet
sudo dnf install -y dotnet-sdk-2.2
