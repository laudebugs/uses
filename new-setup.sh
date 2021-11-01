#!/bin/sh

## Run updates
sudo apt update

# Install Ansible
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

ansible-playbook laudebugs