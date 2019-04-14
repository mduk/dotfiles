#!/bin/bash

source base.sh

# system
install xbacklight

# Audio
install mpc mpd ncmpc

# dev
install nginx
install jq httpie

source xdesktop.sh

# tidy up
sudo apt autoremove -y
