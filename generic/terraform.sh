#!/bin/bash

# terraform
version=0.12.5
tf_package="terraform_${version}_linux_amd64.zip"

curl -O "https://releases.hashicorp.com/terraform/${version}/${tf_package}"
unzip $tf_package -d ~/bin/
rm $tf_package
