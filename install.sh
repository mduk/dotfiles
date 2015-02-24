#!/bin/bash

cd ~
git clone https://github.com/mduk/dotfiles.git .dotfiles
echo "source \"~/.dotfiles/sourceme.sh\"" >> ~/.bash_profile

