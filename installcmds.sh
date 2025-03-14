sudo apt update -y

sudo apt install -y adwaita-icon-theme-full adwaita-qt tcl-awthemes lxappearance
sudo apt install -y bc gnuplot
sudo apt install -y binutils build-essential pkg-config cmake
sudo apt install -y dos2unix
sudo apt install -y exfatprogs
sudo apt install -y p7zip-full
sudo apt install -y ncat
sudo apt install -y tree
sudo apt install -y openssh-server openssh-client
sudo apt install -y mpd mpc ncmpc kid3 flac mediainfo
sudo apt install -y mpv vlc ffmpeg dvdbackup handbrake sox
sudo apt install -y telnet nmap openssl whois
sudo apt install -y tmux vim git jq httpie
sudo apt install -y i3-wm suckless-tools feh polybar scrot dunst keychain
sudo apt install -y xsel arandr read-edid xclip x11-utils
sudo apt install -y v4l-utils qv4l2
sudo apt install -y pavucontrol pavumeter pamix
sudo apt install -y rxvt-unicode
sudo apt install -y inkscape gimp
sudo apt install -y xscreensaver xscreensaver-data-extra
sudo apt install -y xvkbd xbindkeys libinput-tools

sudo apt autoremove -y


sudo sed -i \
  -e '/^GRUB_TIMEOUT=/s/=.*/=3/' \
  -e '/^GRUB_TIMEOUT_STYLE=/s/=.*/="menu"/' \
  -e '/^GRUB_CMDLINE_LINUX_DEFAULT=/s/=.*/=""/' \
  /etc/default/grub
sudo update-grub

exit

pulse_tcp_listener=/etc/pulse/default.pa.d/tcp-listener.pa
if [[ ! -f $pulse_tcp_listener ]]
then echo "load-module module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" \
  | sudo tee $pulse_tcp_listener
fi

# missing: install mpd.conf

sudo adduser $USER dialout

xrdb ~/.Xresources
