alias e="vim -p"
alias se="sudo vim"

alias ep="e ${DEV_DIR}/mduk/dotfiles/ps1.sh"
alias evrc="e ~/.vimrc"
alias ehosts="se /etc/hosts"

ew() {
    path="$(which $1)"
    owner="$(ls -ld $path | awk '{print $3}')"
    cmd="$EDITOR"
    if [[ "$owner" != "$USER" ]]; then
        cmd="sudo $EDITOR"
    fi
    $cmd "$path"
}
