#!/bin/bash
sudo apt install python3
which python3
sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible
python3 -m pip install --user ansible
python3 -m pip install --user ansible-core
#test
