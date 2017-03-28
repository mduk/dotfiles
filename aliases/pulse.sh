alias pa="pacmd"
alias pall="pa list | sed -n \
    -e '/(s).*\.$/p' \
    -e '/^\s*index/p' \
    -e '/^\s*name:/p' \
    -e '/application\.name = /p'
"
