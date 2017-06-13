export DOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

alias dot="source $DOT_DIR/dot.sh"
alias cdf="cd $DOT_DIR"

function dotup {
  pushd ~/.dotfiles
  gf && gp
  dot
  popd
}

export TERM="xterm-256color"

source "$DOT_DIR/env.sh"
source "$DOT_DIR/path.sh"

source "$DOT_DIR/ps1.sh"
source "$DOT_DIR/powerline.sh"

source "$DOT_DIR/aliases/baseconversion.sh"
source "$DOT_DIR/aliases/clipboard.sh"
source "$DOT_DIR/aliases/chef.sh"
source "$DOT_DIR/aliases/comedy.sh"
source "$DOT_DIR/aliases/docker.sh"
source "$DOT_DIR/aliases/erlang.sh"
source "$DOT_DIR/aliases/files.sh"
source "$DOT_DIR/aliases/general.sh"
source "$DOT_DIR/aliases/git.sh"
source "$DOT_DIR/aliases/grep.sh"
source "$DOT_DIR/aliases/i3.sh"
source "$DOT_DIR/aliases/mpd.sh"
source "$DOT_DIR/aliases/php.sh"
source "$DOT_DIR/aliases/pulse.sh"
source "$DOT_DIR/aliases/python.sh"
source "$DOT_DIR/aliases/ruby.sh"
source "$DOT_DIR/aliases/ssh.sh"
source "$DOT_DIR/aliases/vagrant.sh"
source "$DOT_DIR/aliases/vim.sh"
source "$DOT_DIR/aliases/youtube.sh"
