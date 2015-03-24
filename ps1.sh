function parse_git_branch_and_add_brackets {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
}

USER_HOST_PATH="\033[1m[\u@\h:\w]\033[0m"

RUBY_VERSION=`ruby -v | cut -d' ' -f2`
RUBY="\033[35m[$RUBY_VERSION]\033[0m"

TIME="\033[1m[\t]\033[0m"

export PS1="\n\n$USER_HOST_PATH $RUBY \033[0;32m\$(parse_git_branch_and_add_brackets)\[\033[0m\]\n$TIME \$ "
