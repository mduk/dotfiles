my_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

alias edf="vim $my_dir && source $my_dir/sourceme.sh"
alias c="clear"

source "$my_dir/aliases/git.sh"
source "$my_dir/aliases/erlang.sh"
source "$my_dir/aliases/ruby.sh"
source "$my_dir/aliases/vagrant.sh"
source "$my_dir/aliases/chef.sh"
source "$my_dir/aliases/comedy.sh"
source "$my_dir/aliases/files.sh"
