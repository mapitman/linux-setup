#!/bin/bash

# terraform
tf_package=terraform_0.11.8_linux_amd64.zip
curl -O https://releases.hashicorp.com/terraform/0.11.8/$tf_package
unzip terraform_0.11.8_linux_amd64.zip -d ~/bin/
rm $tf_package
