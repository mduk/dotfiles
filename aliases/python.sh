# Python Aliases

function touchmod {
    if [ -z $1 ]; then
        echo "Need module name!"
        return 1
    fi
    mkdir $1
    touch $1/__init__.py
}
