# Movement
alias ..="cd .."
alias ...="cd ../.."

# Tree Listing
alias t="t4"
alias t2="tree -L 2"
alias t3="tree -L 3"
alias t4="tree -L 4"

# Move to common locations
function mvdoc {
  mv "$1" "$HOME/Documents/"
}

function mvpic {
  mv "$1" "$HOME/Pictures/"
}

function mvbg {
  mv "$1" "$DOT_DIR/backgrounds/"
}

# Go Home
alias h="cd ~"

# Go to MY Development directory
alias cdm="cd $DEV_DIR/mduk"

# Go to Doftiles Dev directory
alias cdf="cd $DEV_DIR/mduk/dotfiles"

# Default file listing with meaningful file sizes
alias ll="ls -lh"

# List Everything
alias lla="ll -a"

# List only Directories
alias lld="ll -d */"

function f {
  find . -name "*$1*" | hl "$1"
}
