dot_dir="$HOME/.dotfiles"
ssh_url="git@github.com:mduk/dotfiles.git"
http_url="https://github.com/mduk/dotfiles.git"

if [[ -f $HOME/.ssh/id_rsa ]]
then git clone "$ssh_url" "$dot_dir"
else git clone "$http_url" "$dot_dir"
fi

echo -e "\n\nsource \"$HOME/.dotfiles/dot.sh\"" >> $HOME/.bashrc
