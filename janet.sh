#!/bin/bash

sudo add-apt-repository universe
sudo add-apt-repository multiverse

sudo apt update
sudo apt upgrade -y

sudo apt install -y git
git config --global user.email "daniel.kendell@gmail.com"
git config --global user.name "Daniel Kendell"

sudo apt install -y avahi-daemon avahi-discover avahi-utils libnss-mdns mdns-scan

sudo apt install -y exfat-utils

if [[ ! -f  ./plexmediaserver_1.14.1.5488-cc260c476_amd64.deb ]]
then
  wget https://downloads.plex.tv/plex-media-server/1.14.1.5488-cc260c476/plexmediaserver_1.14.1.5488-cc260c476_amd64.deb
  sudo dpkg -i ./plexmediaserver_1.14.1.5488-cc260c476_amd64.deb 
fi

sudo apt install -y tree

sudo apt install -y openjdk-8-jre-headless

if [[ ! -d "$HOME/.dotfiles" ]]
then
  git clone https://github.com/mduk/dotfiles.git "$HOME/.dotfiles"

  (
    echo
    echo 'if [[ -f $HOME/.dotfiles/dot.sh ]]'
    echo 'then source "$HOME/.dotfiles/dot.sh"' 
    echo 'else echo "Dotfiles missing? $HOME/.dotfiles/dot.sh not found."'
    echo 'fi'
    echo
 ) >> ~/.bashrc
else
  echo "Dotfiles already cloned"
fi

sudo apt install -y exiftool jq
sudo apt install -y ffmpeg ubuntu-restricted-extras \
	            dvdbackup handbrake-cli libdvd-pkg jq

sudo apt install -y ffmpeg alsa alsa-utils

sudo apt autoremove -y
