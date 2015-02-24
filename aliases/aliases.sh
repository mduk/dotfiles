my_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

alias ebp="vim ~/.bash_profile && source ~/.bash_profile"
alias fucking="sudo"
alias c="clear"
alias t="tree"
alias ll="ls -lh"

source "$my_dir/git.sh"
source "$my_dir/erlang.sh"
source "$my_dir/ruby.sh"
source "$my_dir/vagrant.sh"
source "$my_dir/chef.sh"
