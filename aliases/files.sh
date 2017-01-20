# Tree Listing
alias t="tree -L 4"
alias t2="tree -L 2"
alias t3="tree -L 3"

# Go Home
alias h="cd ~"

# Go to the Development directory
alias d="cd $DEV_DIR"

# Go to MY Development directory
alias cdm="cd $DEV_DIR/mduk"

# Go to Doftiles Dev directory
alias cdf="cd $DEV_DIR/mduk/dotfiles"

alias up="cd .."
alias up2="cd ../.."

# Default file listing with meaningful file sizes
alias ll="ls -lh"

# List Everything
alias lla="ll -a"

# List only Directories
alias lld="ll -d */"

# Make and Change Into directory
function mkcd {
  mkdir -p $1
  cd $1
}

# View Permissions
function p {
  stat -c '%A' $1 \
    | sed -n \
      -re 's/^([a-z-])([r|w|x|-]{3})([r|w|x|-]{3})([r|w|x|-]{3})/\1 \2 \3 \4/p'

  stat -c '%a' $1 \
    | sed -n \
      -re 's/([0-9])([0-9])([0-9])/   \1   \2   \3/p'
}

# Toggle Executable bit on file
function x {
    if [[ -x "$1" ]]; then
        chmod -x "$1"
    else
        chmod +x "$1"
    fi
}
