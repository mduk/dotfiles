baseprompt="\n\[\033[1m\][\u@\h:\w]\[\033[0;32m\]"

function git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
}

function ruby_info {
  echo "\[\033[0;91m\][$(ruby -v | awk '{print $2}')]\[\033[0m\]"
}

function python_info {
  echo "[$(python --version 2>&1 | awk '{print $2}')]"
}

firstline="$baseprompt\$(git_branch) $(ruby_info) $(python_info)"

secondline="\[\033[1m\][\$(date +%k:%M:%S)]\[\033[0m\] \$ "

export PS1="$firstline\n$secondline"
