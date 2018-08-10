#!/bin/bash

package() {
  echo -n "Installing $1: "

  if sudo dpkg -s $1 | grep '^Status:.* ok .*' >/dev/null 2>/dev/null
  then
    echo "Already Installed"
    return 0
  else
    echo -n "Installing"
    if sudo apt-get install -y $1 | sed 's/^/   /'
    then echo "OK"
    else echo "ERROR"
    fi
  fi
}

symlink() {
  declare target="$PWD/$1"
  declare link="$2"

  echo -n "Linking ./$1 to $link: "

  if [[ -L "$link" ]]
  then
    if [[ $(readlink "$link") == "$target" ]]
    then
      echo "Link already exists"
    else
      echo "Unknown Link found:"
      echo "     Link: $link"
      echo "   Target: $(readlink "$link")"
      echo "  Desired: $target"
    fi
    return
  fi

  if [[ -f "$link" ]]
  then
    echo "  Blocked by file. Moving aside."
    mv "$link" "$link.predot"
  fi

  if [[ ! -L "$link" ]]
  then
    echo "  Created Link "
    ln -s "$target" "$link"
  fi
}



# Update APT
echo -n "Updating APT... "
if sudo apt-get update >/dev/null
then echo "Done"
else echo "Error"
fi

for arg in "$@"
do source "./install-${arg}.sh"
done
