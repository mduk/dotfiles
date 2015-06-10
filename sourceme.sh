my_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

alias resource="source $my_dir/sourceme.sh"
alias e="vim -p"
alias edf="vim $my_dir && git --work-tree=$my_dir add . && git --work-tree=$my_dir commit $my_dir && resource"
alias c="clear"

source "$my_dir/ps1.sh"

source "$my_dir/aliases/clipboard.sh"
source "$my_dir/aliases/git.sh"
source "$my_dir/aliases/erlang.sh"
source "$my_dir/aliases/ruby.sh"
source "$my_dir/aliases/vagrant.sh"
source "$my_dir/aliases/chef.sh"
source "$my_dir/aliases/comedy.sh"
source "$my_dir/aliases/files.sh"
source "$my_dir/aliases/php.sh"
