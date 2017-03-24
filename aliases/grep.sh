function g {
    grep --color=always \
         --exclude=*.swp \
         --exclude=*.pyc \
         --exclude-dir=.git/ \
         --recursive \
         --line-number \
         "$1" \
         "${2:-.}"
}

function gi {
    grep --color=always \
         --exclude=*.swp \
         --exclude=*.pyc \
         --exclude-dir=.git/ \
         --recursive \
         --line-number \
         --ignore-case \
         "$1" \
         "${2:-.}"
}
