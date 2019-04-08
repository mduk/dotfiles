sudo add-apt-repository universe
sudo add-apt-repository multiverse

sudo apt update
sudo apt upgrade -y

install() {
  apt install -y "$@"
}

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

install exfat-utils

install nmap

install openssh-server \
        openssh-client

install avahi-daemon \
        avahi-discover \
        avahi-utils \
        libnss-mdns \
        mdns-scan

install vim \
        screen

install dos2unix \
        dialog
