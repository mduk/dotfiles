alias shutdown="sudo shutdown -h now"
alias reboot="sudo reboot"

alias o="xdg-open"
alias e="vim -p"
alias c="clear"
alias s="sudo"
alias se="sudo vim"
alias ehosts="se /etc/hosts"
alias evrc="e ~/.vimrc"
alias rmb="find . -name *.bkp -exec rm -r {} \;"

alias ep="e ${DEV_DIR}/mduk/dotfiles/ps1.sh"

alias lsp="apt list --installed | tail -n +2 | sed -re 's/^(.*)\/.+/\1/'"

function cdd {
  cd "${DEV_DIR}/${1}"
}

function hl {
    sed -e "s/\($1\)/\x1b[7m\1\x1b[0m/g"
}

# http://stackoverflow.com/questions/1763891/can-stdout-and-stderr-use-different-colors-under-xterm-konsole
hlerr()(
  set -o pipefail;"$@" 2>&1>&3 | sed $'s,.*,\e[91m\e[1m&\e[7m,' >&2
) 3>&1

alias cusb="cd /mnt/usb"

alias mfat="sudo mount -o \"umask=033,gid=1000,uid=1000\""
alias mext="sudo mount"

function musb {
    mfat /dev/sda1 /mnt/usb
    mext /dev/sda2 /mnt/sshkeys
}

function umusb {
    sudo umount /dev/sda1
    sudo umount /dev/sda2
}
