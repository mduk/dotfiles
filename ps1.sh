function git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
}

function ruby_version {
  ruby -v | awk '{print $2}' | sed -e 's/\(.*\)/[\1]/'
}

export PS1="\033[1m[\u@\h:\w]\[\033[0;32m\]\$(git_branch) \033[0;91m$(ruby_version) \[\033[0m\]\n\$ "
