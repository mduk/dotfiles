terminal_width() {
    local cols=$(tput cols)

    if [[ $cols -eq 210 ]]; then
        echo "1"
    elif [[ $cols -lt 210 ]] && [[ $cols -ge 103 ]]; then
        echo "2"
    elif [[ $cols -lt 103 ]] && [[ $cols -ge 68 ]]; then
        echo "3"
    else
        echo "4"
    fi
}

prompt_command() {

    PS1=""

    if [[ $(tput lines) -ge 20 ]]; then

        # Previous command status bar
        PS1="\033[48;5;\$([[ \$? -gt 0 ]] && echo \"88\" || echo \"22\")m\033[K\033[0m"

        # Distance from previous command
        PS1="${PS1}\n\n"

    fi

    # User/Host/Directory
    PS1="${PS1}\[\033[1m\][\u@\h:\w]\033[0m\]"

    # Break prompt in narrow terminals if we're anywhere other than the home directory
    PS1="${PS1}\$([[ \$(tput cols) -le 80 ]] && [[ \$(pwd) != \$HOME ]] && echo \"\[\n\]\")"

    # Git Branch
    PS1="${PS1}\[\033[0;32m\]\$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/')\[\033[0m\]"

    # Begin Ruby Block
    PS1="${PS1}\[\033[0;91m\]["

        # Ruby Version
        PS1="${PS1}$(ruby -v | awk '{print $2}')"

    # End Ruby Block
    PS1="${PS1}]\[\033[0m\]"

    # Begin Python Block
    PS1="${PS1}\[\033[0;93m\]["

        # Python Version
        PS1="${PS1}$(python --version 2>&1 | awk '{print $2}')"

        # Python VirtualEnv
        PS1="${PS1}\$([[ -v VIRTUAL_ENV ]] && echo \" venv\")"

    # End Python Block
    PS1="${PS1}]\[\033[0m\]"

    # Newline
    PS1="${PS1}\n"

    if [[ -f "$(pwd)/.ps1" ]]; then

        PS1="${PS1}$(source "$(pwd)/.ps1")\n"
    fi

    # Timestamp
    PS1="${PS1}\[\033[1m\][\$(date +%k:%M:%S)]\[\033[0m\] \$ "

export PS1="${PS1}"
}

PROMPT_COMMAND=prompt_command
