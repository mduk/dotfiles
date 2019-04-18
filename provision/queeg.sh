#!/bin/bash

source base.sh

header System
install xbacklight

header Music
install mpc mpd ncmpc

header Web Dev
install nginx
install jq httpie

source xdesktop.sh
source video-tools.sh

header Apt Autoremove
sudo apt autoremove -y
