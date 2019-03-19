sudo apt update

sudo apt upgrade -y

install() {
  sudo apt install -y "$@"
}

# system
install xbacklight exfat-utils openssh-server

# command line
install screen vim tmux tree melt mpc mpd ncmpc

# dev
install dialog git dos2unix jq httpie nmap

# graphical
install xscreensaver xscreensaver-data-extra xscreensaver-gl-extra xscreensaver-screensaver-bsod
install ttf-mscorefonts-installer scrot vlc xcape i3 suckless-tools konsole pavucontrol feh guvcview arandr
