#!/bin/bash

echo "Setting up node.js tools..."
# npm 5.8 has bugs, downgrade it
sudo npm install -g npm@5.7.1
sudo npm install -g gulp eslint

