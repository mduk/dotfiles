# Python Aliases

function touchmod {
    if [ -z $1 ]; then
        echo "Need module name!"
        return 1
    fi
    mkdir $1
    touch $1/__init__.py
}

# VirtualEnv
#   If a venv directory doesn't exist, initialise one
#   Toggle the venv
function venv {
    if [[ ! -d venv ]]; then
        virtualenv venv
    fi

    if [[ ${VIRTUAL_ENV:=unset} = "unset" ]]; then
        source venv/bin/activate
    else
        deactivate
    fi
}
