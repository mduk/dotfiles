. include.sh

header Authorisation
sudo echo "OK"

header Configuring Repositories
sudo add-apt-repository universe
sudo add-apt-repository multiverse

header APT Update and Upgrade
sudo apt update
sudo apt upgrade -y

header Git and Dotfiles
install -y git
git config --global user.email "daniel.kendell@gmail.com"
git config --global user.name "Daniel Kendell"

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

header Filesystems
install exfat-utils

header Network Utilities
install nmap
install avahi-daemon \
        avahi-discover \
        avahi-utils \
        libnss-mdns \
        mdns-scan

header Services
install openssh-server \
        openssh-client

header Command Line Utilities
install vim \
        screen \
        inotify-tools

header Shell Scripting Utilities
install dos2unix \
        dialog
