function parse_git_branch_and_add_brackets {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
}

export PS1="\033[1m[\u@\h:\w]\[\033[0;32m\]\$(parse_git_branch_and_add_brackets) \[\033[0m\]\n\$ "
