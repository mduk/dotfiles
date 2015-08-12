alias ehosts="sudo vim /etc/hosts"
alias evrc="e ~/.vimrc"
alias g="grep --color=always --exclude=*.swp -R"
alias rmb="find . -name *.bkp -exec rm -rf {} \;"

function dotup {
  pushd ~/.dotfiles
  gf && gp
  dot
  popd
}
