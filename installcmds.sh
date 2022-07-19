sudo apt update -y

sudo apt install -y adwaita-icon-theme-full adwaita-qt tcl-awthemes lxappearance
sudo apt install -y bc gnuplot
sudo apt install -y binutils build-essential pkg-config
sudo apt install -y docker.io docker-compose kubernetes
sudo apt install -y dos2unix
sudo apt install -y exfatprogs
sudo apt install -y firefox chromium-browser
sudo apt install -y i3-wm suckless-tools feh polybar scrot
sudo apt install -y inkscape gimp
sudo apt install -y mpd mpc ncmpc
sudo apt install -y mpv vlc ffmpeg dvdbackup handbrake
sudo apt install -y v4l-utils qv4l2
sudo apt install -y obs-studio
sudo apt install -y nginx nginx-doc
sudo apt install -y npm
sudo apt install -y openscad
sudo apt install -y openssh-server openssh-client
sudo apt install -y pavucontrol pavumeter pamix
sudo apt install -y pipenv
sudo apt install -y rxvt-unicode
sudo apt install -y telnet nmap openssl whois
sudo apt install -y tmux vim git jq httpie
sudo apt install -y tree
sudo apt install -y virtualbox vagrant
sudo apt install -y xscreensaver xscreensaver-data-extra
sudo apt install -y xsel arandr read-edid xclip
sudo apt install -y kicad
sudo apt install -y xvkbd xbindkeys libinput-tools

sudo apt autoremove -y

sudo sed -i \
  -e '/^GRUB_TIMEOUT=/s/=.*/=3/' \
  -e '/^GRUB_TIMEOUT_STYLE=/s/=.*/="menu"/' \
  -e '/^GRUB_CMDLINE_LINUX_DEFAULT=/s/=.*/=""/' \
  /etc/default/grub
sudo update-grub

sudo adduser $USER dialout

git config --global user.email "daniel.kendell@gmail.com"
git config --global user.name "Daniel Kendell"

xrdb ~/.Xresources
