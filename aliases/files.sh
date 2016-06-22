alias t="tree -L 4"

alias h="cd ~"
alias d="cd ~/dev"

alias up="cd .."
alias up2="cd ../.."

alias ll="ls -lh"

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
