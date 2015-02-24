#!/bin/bash

cd $HOME
git clone git@github.com:mduk/dotfiles.git .dotfiles
echo "source \"$HOME/.dotfiles/sourceme.sh\"" >> ~/.bash_profile

