#!/bin/sh

## Ansible setup
# https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#from-pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3 get-pip.py --user
python3 -m pip install --user ansible
python3 -m pip install --user paramiko
sudo python3 get-pip.py
sudo python3 -m pip install ansible

# Install Xcode Command Line Tools
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
source ~/.zprofile

## install git
brew install git

git clone https://github.com/lbugasu/uses.git && cd uses

ansible-playbook macos/setup.yml
