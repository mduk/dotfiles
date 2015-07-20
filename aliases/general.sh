alias ehosts="sudo vim /etc/hosts"
alias g="grep --color=always --exclude=*.swp -R"

function dotup {
  pushd ~/.dotfiles
  gf && gp
  dot
  popd
}
