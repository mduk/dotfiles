alias gs="git status"

alias gd="git diff"
alias gds="git diff --staged"

alias ga="git add"
alias gc="git commit"
alias gca="gc --amend"

alias gll="git log --oneline"

alias gcb="git checkout -b"
alias gls="gs -s"
alias gbl="git branch"
alias gf="git fetch"
alias gp="git pull"
alias grh="git reset HEAD"
alias gb="git checkout"

alias grm="git rm -r"
alias gmv="git mv"

alias gei="e .gitignore"
alias gai="ga .gitignore"

alias gpo="git push origin"
alias gpom="gpo master"
alias gpot="gpo --tags"

function gpob {
  branch=$(git symbolic-ref -q HEAD)
  branch=${branch##refs/heads/}
  gpo $branch
}

function gnb {
  if [ -z "$1" ]; then
    echo "Specify a branch name as the first parameter"
    return 1
  fi

  git checkout integration
  gf
  gp
  git checkout -b "$1"
}
