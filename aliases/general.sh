alias e="vim -p"
alias c="clear"
alias s="sudo"
alias se="sudo vim"
alias ehosts="se /etc/hosts"
alias evrc="e ~/.vimrc"
alias g="grep --color=always --exclude=*.swp --exclude .git/ -R -n"
alias rmb="find . -name *.bkp -exec rm -r {} \;"

alias ep="e ${DEV_DIR}/mduk/dotfiles/ps1.sh"

function cdd {
  cd "${DEV_DIR}/${1}"
}

function dotup {
  pushd ~/.dotfiles
  gf && gp
  dot
  popd
}

function hl {
    sed -e "s/\($1\)/\x1b[7m\1\x1b[0m/g"
}
