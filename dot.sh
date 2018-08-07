export DOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

alias dot="source $DOT_DIR/dot.sh"
alias cdf="cd $DOT_DIR"

function dotup {
  pushd ~/.dotfiles
  gf && gp
  dot
  popd
}

source "$DOT_DIR/env.sh"
source "$DOT_DIR/path.sh"

source "$DOT_DIR/ps1.sh"
#source "$DOT_DIR/powerline.sh"

for aliases in $(ls "$DOT_DIR/aliases"); do
  source "$DOT_DIR/aliases/$aliases"
done
