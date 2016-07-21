alias dot="source $my_dir/sourceme.sh"
alias cdf="cd $DEV_DIR/mduk/dotfiles"


#alias edf="vim $my_dir && git --work-tree=$my_dir add . && git --work-tree=$my_dir commit $my_dir && dot"

function dotup {
  pushd ~/.dotfiles
  gf && gp
  dot
  popd
}

