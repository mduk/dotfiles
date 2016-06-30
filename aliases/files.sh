# Tree Listing
alias t="tree -L 4"

# Go Home
alias h="cd ~"

# Go to the Development directory
alias d="cd ~/Development"

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

# Toggle Executable bit on file
function x {
    if [[ -x "$1" ]]; then
        chmod -x "$1"
    else
        chmod +x "$1"
    fi
}
