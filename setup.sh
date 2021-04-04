#!/bin/sh
# run as root
# sudo -i
cd ..
# Work from a setup folder
mkdir setup && cd setup
sudo apt-get update
sudo apt upgrade -y
sudo apt install wget -y

# install Snapd (https://snapcraft.io/docs/installing-snap-on-ubuntu)
sudo apt update
sudo apt install snapd

# Git
echo Installing git...
sudo apt install git

echo "Setting up github"
echo "What's your github username?"
read github_username
git config user.name = $github_username

echo "What's your github email?"
read github_email
git config user.email = $github_email

## Node
# gcc
sudo apt install build-essential
# Python3 
# Install Node
sudo snap install node --classic

# Browsers - Google Chrome, Chromium, Brave
# install google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
# install Chromium
sudo snap install chromium
# install Brave (https://brave.com/linux/)
sudo snap install brave


## Code Editors
# VS Code (https://code.visualstudio.com/docs/setup/linux)
sudo snap install --classic code
# IDEA
sudo snap install intellij-idea-community --classic


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

# MongoDB Compass
wget https://downloads.mongodb.com/compass/mongodb-compass_1.26.0_amd64.deb
sudo dpkg -i mongodb-compass_1.26.0_amd64.deb

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
sudo apt install vim

# VLC
sudo snap install vlc


## Fonts

# Rebuild font cache
fc-cache -f -v


## CUSTOMIZATIONS
# Terminal
# Gogh (https://github.com/Mayccoll/Gogh)
sudo apt-get install dconf-cli uuid-runtime
bash -c "$(wget -qO- https://git.io/vQgMr)" 
# SURU++ (https://github.com/gusbemacbe/suru-plus)
wget -qO- https://raw.githubusercontent.com/gusbemacbe/suru-plus/master/install.sh | sh
# SURU + Folders (https://gusbemacbe.github.io/suru-plus-folders/en/)
wget -qO- https://git.io/fhQdI | sh
# Set folders to 90ssummer
suru-plus-folders -C 90ssummer --theme Suru++