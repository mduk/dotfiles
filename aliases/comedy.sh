alias fucking="sudo"
alias ffs="fucking !!"

function fuckyoucitrix() {
  kill $(ps ax | grep ICAClient | grep -v grep | tail -n 1 | awk '{print $1}')
}
