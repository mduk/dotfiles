#!/bin/bash

set -e

sudo apt update
sudo xargs apt install < packages

JANET_HOST=janet.local

echo "Copying SSH Keys, looking for Janet..."
if ping $JANET_HOST -c 1 &>/dev/null
then rsync -avh -e 'ssh -o StrictHostKeyChecking=no' $USER@$JANET_HOST:~/.ssh/ $HOME/.ssh/
else echo "Can't find Janet. SSH keys won't be installed!" >&2
fi

git config --global user.email "daniel@kendell.org.uk"
git config --global user.name "Daniel Kendell"

dot_dir="$HOME/.dotfiles"
ssh_url="git@github.com:mduk/dotfiles.git"
http_url="https://github.com/mduk/dotfiles.git"

if [[ ! -d $dot_dir ]]
then
  if [[ -f $HOME/.ssh/id_rsa ]]
  then git clone "$ssh_url" "$dot_dir"
  else git clone "$http_url" "$dot_dir"
  fi
fi

if ! grep 'dot.sh' $HOME/.bashrc
then echo -e "\n\nsource \"$HOME/.dotfiles/dot.sh\"" >> $HOME/.bashrc
else echo "already dotty"
fi


