#!/bin/bash

# Change Debian to SID Branch
cp /etc/apt/sources.list /etc/apt/sources.list.bak
cp sources.list /etc/apt/sources.list 
cp plank.desktop /etc/xdg/autostart
# Remove obslete packages
sudo apt remove atril* parole* xarchiver* xsane* xterm* xfburn* exfalso* -y

sudo apt purge atril* parole* xarchiver* xsane* xterm* xfburn* exfalso* -y

sudo apt autoremove -y

# Update packages list
sudo apt update

sudo apt upgrade -y

# Add base packages
sudo apt install file-roller clipman unzip evince neofetch plank htop vlc libdvd-pkg rhythmbox kodi pulseeffects pavucontrol nemo papirus-icon-theme fonts-noto-color-emoji fonts-firacode fonts-font-awesome micro gdebi -y

# Setting up the dpkg
sudo dpkg-reconfigure libdvd-pkg

#Addition packages to install
cd Packages/
sudo gdebi code.deb -n
sudo gdebi GitHubDesktop-linux.deb -n
sudo gdebi google-chrome-stable_current.deb -n
sudo gdebi teams.deb -n

# Download Nordic Theme
cd /usr/share/themes/
git clone https://github.com/EliverLara/Nordic.git

# Make Theme folders
mkdir -p ~/.themes ~/.fonts

# Fira Code Nerd Font variant needed
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
unzip FiraCode.zip -d ~/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
unzip Meslo.zip -d ~/.fonts   
fc-cache -vf

#Ms-fonts
sudo apt install ttf-mscorefonts-installer -y

# Layan Cursors
cd "$HOME/build"
git clone https://github.com/vinceliuice/Layan-cursors
cd Layan-cursors
sudo ./install.sh

Finish off with a reboot
echo "System will reboot in 10 seconds"
sleep 10
sudo reboot