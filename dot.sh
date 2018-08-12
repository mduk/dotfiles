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

for file in $(find ./commands -name '*.alias')
do
  declare alias=$(basename $file | sed -r 's/(.*).alias/\1/')
  declare command=$(cat $file)
  alias "${alias}=${command}"
done

for function in $(find ./commands -name '*.function')
do source "$function"
done
