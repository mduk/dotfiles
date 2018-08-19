set -x
set -e

ssh_url="git@github.com:mduk/dotfiles.git"

if ! which git >/dev/null
then 
  sudo apt-get update
  sudo apt-get install -y git
fi

git clone "$ssh_url" "$HOME/.dotfiles"

echo -e "\n\nsource \"$HOME/.dotfiles/dot.sh\"" >> $HOME/.bashrc
