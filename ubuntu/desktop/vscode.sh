#!/usr/bin/env bash

# vscode
if grep -Fq "Pop" /etc/os-release
then
    sudo apt install code_1
else
    curl -L -o /tmp/vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868 \
    && sudo dpkg -i /tmp/vscode.deb \
    && sudo apt install -fy
    rm /tmp/vscode.deb
fi
