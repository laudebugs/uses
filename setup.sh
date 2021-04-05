#!/bin/sh
# run as root
# sudo -i
do-release-upgrade -d
cd 
# Work from a setup folder
sudo rsync -a backgrounds/ /usr/share/backgrounds/

mkdir ~/setup
cp -r fonts ~/setup/
cd ~/setup
sudo apt-get update -y
sudo apt upgrade -y
sudo apt install wget -y

# install Snapd (https://snapcraft.io/docs/installing-snap-on-ubuntu)
sudo apt update -y
sudo apt install snapd

# install curl
sudo apt install curl

# rsync
sudo apt-get install rsync -y

# Git
echo Installing git...
sudo apt install git

echo "Setting up github"
echo "What's your github username?"
read github_username
git config --global user.name "$github_username"

echo "What's your github email?"
read github_email
git config --global user.email $github_email

## Node
# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
sudo apt-get install nodejs
# Yarn
sudo apt remove cmdtest
sudo apt autoremove
# To solve the error of: there are no scenarios (https://stackoverflow.com/questions/53471063/yarn-error-there-are-no-scenarios-must-have-at-least-one)
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn -y

# g++ 
sudo apt-get install g++ -y
# gcc
sudo apt install build-essential -y

# Python3 
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update -y
sudo apt-get install python3

# Install Node
sudo snap install node --classic

# Kite
bash -c "$(wget -q -O - https://linux.kite.com/dls/linux/current)"

# Java jre
sudo apt-get install default-jre -y

# Nautilus
sudo apt-get update -y
sudo apt-get install -y nautilus

# Browsers - Google Chrome, Chromium, Brave
# install google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
# install Chromium
sudo snap install chromium
# install Brave (https://brave.com/linux/)
sudo snap install brave

## COMMAND LINE INTERFACES
# Heroku
sudo snap install --classic heroku
# React
sudo npm i -g react
# Angular
sudo npm install -g @angular/cli
# NX
sudo npm i -g nx
# AWS
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
# Emma (https://github.com/maticzav/emma-cli)
sudo npm i -g emma-cli
# Firebase
curl -sL https://firebase.tools | bash

## Code Editors
# VS Code (https://code.visualstudio.com/docs/setup/linux)
sudo snap install --classic code
# IDEA
sudo snap install intellij-idea-educational --classic

# Android Studio
sudo snap install android-studio --classic

# Android Devide Bridge
sudo apt-get install android-tools-adb android-tools-fastboot -y
sudo adb start-server

## TOOLS
# CMake
# Slack 
sudo snap install slack --classic

# Notion
sudo snap install notion-snap

# Blender
sudo snap install blender --classic

# Spotify
sudo snap install spotify

# Postman
sudo snap install postman

# Insomnia
sudo snap install insomnia

# Postgres
sudo apt update -y
sudo apt-get install posgresql-12 postgresql-contrib-12
sudo apt-get install postgresql postgresql-contrib -y

# MongoDB Community Edition
sudo apt-get install gnupg
sudo apt-get install libgconf-2-4
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl start mongod

# MongoDB CLI
sudo apt-get install gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo
apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
sudo apt-get update
sudo apt-get install -y mongocli

sudo apt-get update -y
sudo apt-get install -y mongodb-org
# MongoDB Compass
wget https://downloads.mongodb.com/compass/mongodb-compass_1.26.0_amd64.deb
sudo dpkg -i mongodb-compass_1.26.0_amd64.deb

# ddrescue (https://www.tecmint.com/create-bootable-ubuntu-usb-disk/)
sudo apt install gddrescue

# Redis
sudo snap install redis

# Signal
sudo snap install signal-desktop

# Telegram
sudo snap install telegram-desktop

# Zoom
sudo snap install zoom-client

# Simple Screen Recorder
sudo snap install simplescreenrecorder

# Vim
sudo apt search vim
sudo apt install vim -y

# VLC
sudo snap install vlc

# Unzip
sudo apt install unzip

# Epictask
sudo snap install epictask

# Deno
sudo snap install deno


## Fonts
sudo rsync -a fonts/* /usr/share/fonts/
# Rebuild font cache
fc-cache -f -v


## CUSTOMIZATIONS
# Terminal
# Gogh (https://github.com/Mayccoll/Gogh)
# Uncomment for interractive mode
sudo apt-get install dconf-cli uuid-runtime
bash -c "$(wget -qO- https://git.io/vQgMr)" 
## Non-interactive mode
# clone the repo into "$HOME/src/gogh"
# mkdir -p "$HOME/src"
# cd "$HOME/src"
# git clone https://github.com/Mayccoll/Gogh.git gogh
# cd gogh/themes
# necessary on ubuntu
# export TERMINAL=gnome-terminal

# # install themes
# ./zenburn.sh
# ./dracula.sh
# ./sweet.sh
# ./homebrew.sh
# ./lavandula.sh

cd ~/setup/

# SURU++ (https://github.com/gusbemacbe/suru-plus)
wget -qO- https://raw.githubusercontent.com/gusbemacbe/suru-plus/master/install.sh | sh
# SURU + Folders (https://gusbemacbe.github.io/suru-plus-folders/en/)
wget -qO- https://git.io/fhQdI | sh
# Set folders to 90ssummer
suru-plus-folders -C 90ssummer --theme Suru++
# Gnome Tweak Tool
sudo apt install gnome-tweak-tool -y
# Grub Customizer
sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo apt-get update -y
sudo apt-get install grub-customizer -y
# Dracula (https://draculatheme.com/gtk)
wget -O dracula-theme.zip https://github.com/dracula/gtk/archive/master.zip
unzip dracula-theme.zip -d dracula-theme
mkdir Dracula 
mv dracula-theme/gtk-master/* Dracula/
sudo mv Dracula /usr/share/themes/
# Ant Standard Buttons
wget -O Ant-Nebula-Standard-Buttons.tar https://github.com/EliverLara/Ant-Nebula/releases/download/v1.3.0/Ant-Nebula-standard-buttons.tar
mkdir Ant-standard-buttons
mkdir Ant_standard_buttons
tar -xvf Ant-standard-buttons.tar -C Ant_standard_buttons/
mv Ant_standard_buttons/Ant/* Ant-standard-buttons/
sudo mv Ant-standard-buttons /usr/share/themes/
# Ant Nebula
wget -O Ant-Nebula.tar https://github.com/EliverLara/Ant-Nebula/releases/download/v1.3.0/Ant-Nebula.tar
tar -xvf Ant-Nebula.tar
sudo mv Ant-Nebula /usr/share/themes/

# Shell Extendions
sudo apt install gnome-shell-extensions
sudo apt install chrome-gnome-shell

## DRIVERS 
# Nvidia 
sudo apt install nvidia-driver-450 -y
# Synaptic
sudo apt-get install xserver-xorg-input-synaptics

# Log in to cli
# firebase login

# Set favorite apps (https://askubuntu.com/questions/1193496/add-app-to-favorites-from-command-line)
gsettings set org.gnome.shell favorite-apps "['google-chrome.desktop', 'org.gnome.Terminal.desktop', 'chromium_chromium.desktop', 'spotify_spotify.desktop', 'slack_slack.desktop', 'org.gnome.Nautilus.desktop', 'intellij-idea-educational_intellij-idea-educational.desktop', 'notion-snap_notion-snap.desktop', 'code_code.desktop']"

# rebuild font cache one more time
fc-cache -f -v