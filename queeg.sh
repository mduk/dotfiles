#!/bin/bash

source base.sh

# system
install xbacklight

# Audio
install mpc mpd ncmpc

# Video (X11)
install mpv

# dev
install jq httpie

# graphical
install xscreensaver \
        xscreensaver-data-extra \
        xscreensaver-gl-extra \
        xscreensaver-screensaver-bsod

install ttf-mscorefonts-installer scrot vlc xcape i3 suckless-tools konsole pavucontrol feh guvcview arandr
install adwaita-qt

sudo apt autoremove -y
