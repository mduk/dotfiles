apt_repo() {
  sudo add-apt-repository -y $1
  sudo apt update
}

install() {
  sudo apt install -y "$@"
}

header() {
  echo -ne "\n\n"
  echo "################################################################################"
  echo "# " $@
  echo "################################################################################"
}

