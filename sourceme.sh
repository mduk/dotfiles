my_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Add .local/bin/ to PATH
export PATH="$PATH:~/.local/bin/"

# Add the Composer bin/ to PATH
export PATH="$PATH:~/.composer/vendor/bin/"

# Add my personal bin/ to the front of the PATH, overriding everything else
export PATH="~/bin/:$PATH"

# Default editor should always be vim
export EDITOR="vim"
export VISUAL="vim"

# Don't want Python VirtualEnv's default prompt modification
# I'll take care of that myself in ps1.sh
export VIRTUAL_ENV_DISABLE_PROMPT=1

alias dot="source $my_dir/sourceme.sh"
alias edf="vim $my_dir && git --work-tree=$my_dir add . && git --work-tree=$my_dir commit $my_dir && dot"

# Prompt
source "$my_dir/ps1.sh"

# Aliases
source "$my_dir/aliases/clipboard.sh"
source "$my_dir/aliases/chef.sh"
source "$my_dir/aliases/comedy.sh"
source "$my_dir/aliases/docker.sh"
source "$my_dir/aliases/erlang.sh"
source "$my_dir/aliases/files.sh"
source "$my_dir/aliases/general.sh"
source "$my_dir/aliases/git.sh"
source "$my_dir/aliases/i3.sh"
source "$my_dir/aliases/php.sh"
source "$my_dir/aliases/python.sh"
source "$my_dir/aliases/ruby.sh"
source "$my_dir/aliases/vagrant.sh"
