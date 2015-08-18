alias s="sudo"
alias se="sudo vim"
alias ehosts="se /etc/hosts"
alias evrc="e ~/.vimrc"
alias ei3="e ~/i3/config"
alias g="grep --color=always --exclude=*.swp -R"
alias rmb="find . -name *.bkp -exec rm -rf {} \;"

function dotup {
  pushd ~/.dotfiles
  gf && gp
  dot
  popd
}
