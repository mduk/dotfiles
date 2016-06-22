my_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Add my personal bin/ to the front of the PATH
export PATH="~/bin/:$PATH"

# Add the Composer bin/ to PATH
export PATH="$PATH:~/.composer/vendor/bin/"

alias dot="source $my_dir/sourceme.sh"
alias e="vim -p"
alias edf="vim $my_dir && git --work-tree=$my_dir add . && git --work-tree=$my_dir commit $my_dir && dot"
alias c="clear"

# Prompt
source "$my_dir/ps1.sh"

# Aliases
source "$my_dir/aliases/clipboard.sh"
source "$my_dir/aliases/git.sh"
source "$my_dir/aliases/erlang.sh"
source "$my_dir/aliases/ruby.sh"
source "$my_dir/aliases/vagrant.sh"
source "$my_dir/aliases/chef.sh"
source "$my_dir/aliases/comedy.sh"
source "$my_dir/aliases/files.sh"
source "$my_dir/aliases/general.sh"
source "$my_dir/aliases/php.sh"
