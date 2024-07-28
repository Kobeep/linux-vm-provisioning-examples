#!/bin/bash
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt install vagrant
sudo cp /etc/apt/sources.list /etc/apt/sources.list."$(date +"%F")"
sudo sed -i -e '/^# deb-src.*universe$/s/# //g' /etc/apt/sources.list
sudo apt-get -y update
sudo apt-get -y install nfs-kernel-server
sudo systemctl enable --now nfs-server
sudo apt-get -y build-dep vagrant ruby-libvirt
sudo apt-get -y install ebtables dnsmasq-base
sudo apt-get -y install libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev
vagrant plugin install vagrant-libvirt
