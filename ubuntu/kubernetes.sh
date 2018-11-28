#!/bin/bash

# kubectl
sudo snap install --classic kubectl

# minikube
sudo apt-get install -y qemu qemu-kvm virt-manager virt-top libguestfs-tools virtinst bridge-utils
sudo systemctl enable virtlockd.service
sudo systemctl start virtlockd.service
sudo modprobe vhost_net
lsmod | grep vhost
echo 'vhost_net' | sudo tee --append /etc/modules > /dev/null

