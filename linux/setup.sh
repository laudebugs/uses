#!/bin/sh

su -
apt-get install sudo -y

## Run updates
sudo apt update

# Install Ansible
sudo apt install software-properties-common -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

git clone https://github.com/lbugasu/uses.git && cd uses

ansible-playbook linux/setup.yml
