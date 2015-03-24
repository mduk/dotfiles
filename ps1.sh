GIT_BRANCH=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\\[\1\]/'`
GIT="\[\033[92m\]$GIT_BRANCH\[\033[0m\]"

USER_HOST_PATH="\[\033[1m\][\u@\h:\w]\[\033[0m\]"

RUBY_VERSION=`ruby -v | cut -d' ' -f2`
RUBY="\[\033[35m\][$RUBY_VERSION]\[\033[0m\]"

TIME="\[\033[1m\][\t]\[\033[0m\]"

export PS1="\n\n$USER_HOST_PATH $RUBY $GIT\n$TIME \$ "
