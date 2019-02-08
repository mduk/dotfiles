#!/bin/bash

source ./dot.sh

apt_install() {
  echo -n "Installing $1: "

  if dpkg -s $1 | grep '^Status:.* ok .*' >/dev/null 2>/dev/null
  then
    echo "Already Installed"
    return 0
  else
    echo -n "Installing"
    if apt-get install -y $1 | sed 's/^/   /'
    then echo "OK"
    else echo "ERROR"
    fi
  fi
}

title() {
  declare title="$@"
  declare title_length=${#title}
  declare n=$((title_length + 4))

  echo
  echo

  for i in $(seq $n)
  do echo -n '#'
  done
  echo

  echo '#' $title '#'

  for i in $(seq $n)
  do echo -n '#'
  done
  echo
}

set -e

title Updating APT
apt-get update

for arg in install.d/*
do source $arg
done
