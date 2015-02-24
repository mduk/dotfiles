#!/bin/bash

set -e

cd $HOME

echo "Cloning mduk/dotfiles into $HOME/.dotfiles"
git clone git@github.com:mduk/dotfiles.git .dotfiles

echo "Adding source line to $HOME/.bash_profile - Don't forget to source it after installing!"
echo "" >> $HOME/.bash_profile
echo "# mduk/dotfiles" >> $HOME/.bash_profile
echo "source \"$HOME/.dotfiles/sourceme.sh\"" >> $HOME/.bash_profile

echo "Installation complete."
echo "Now exec: source \"$HOME/.dotfiles/sourceme.sh\""
