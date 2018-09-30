#!/bin/bash

# kubectl
sudo snap install --classic kubectl

# minikube
sudo apt-get install -y qemu-kvm libvirt-bin virt-top libguestfs-tools virtinst bridge-utils
sudo systemctl enable virtlockd.service
sudo systemctl start virtlockd.service
sudo modprobe vhost_net
lsmod | grep vhost
sudo -i
echo vhost_net >> /etc/modules
