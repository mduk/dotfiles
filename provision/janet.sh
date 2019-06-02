#!/bin/bash

source base.sh

# NFS Server
install nfs-kernel-server

# Plex
if [[ ! -f  ./plexmediaserver_1.14.1.5488-cc260c476_amd64.deb ]]
then
  wget https://downloads.plex.tv/plex-media-server/1.14.1.5488-cc260c476/plexmediaserver_1.14.1.5488-cc260c476_amd64.deb
  sudo dpkg -i ./plexmediaserver_1.14.1.5488-cc260c476_amd64.deb
fi

# Minecraft
install openjdk-8-jre-headless

# Photo
install exiftool \
        jq

# Video
install ffmpeg \
        ubuntu-restricted-extras \
        jq

# DVD
install dvdbackup \
        handbrake-cli \
        libdvd-pkg \
        ffmpeg

# Easycap
install ffmpeg \
        alsa \
        alsa-utils

sudo apt autoremove -y
