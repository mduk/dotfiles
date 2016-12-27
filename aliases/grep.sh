function g {
    grep --color=always \
         --exclude=*.swp \
         --exclude=*.pyc \
         --exclude-dir=.git/ \
         --recursive \
         --line-number \
         $1 \
         .
}

function gi {
    grep --color=always \
         --exclude=*.swp \
         --exclude=*.pyc \
         --exclude-dir=.git/ \
         --recursive \
         --line-number \
         --ignore-case \
         $1 \
         .
}
