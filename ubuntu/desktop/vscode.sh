#!/bin/bash

curl -o /tmp/vscode.deb https://az764295.vo.msecnd.net/stable/f359dd69833dd8800b54d458f6d37ab7c78df520/code_1.40.2-1574694120_amd64.deb
sudo dpkg -i /tmp/vscode.deb
sudo apt install -fy

