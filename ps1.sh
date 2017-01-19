WORK_HOST="dkendell-Latitude-E5470"
MY_USERNAME="daniel"

if [[ -v PROMPT_VERSIONS ]]; then
    export PROMPT_VERSIONS=0
fi

if [[ -v PROMPT_CLOCK ]]; then
    export PROMPT_CLOCK="1"
fi

if [[ -v PROMPT_EXITBAR ]]; then
    export PROMPT_EXITBAR=1
fi

if [[ -v PROMPT_SPACE ]]; then
    export PROMPT_SPACE=2
fi

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

exit_bar() {
    echo "\033[48;5;\$([[ \$? -gt 0 ]] && echo \"88\" || echo \"22\")m\033[K\033[0m"
}

block_screen() {
    if [[ "$TERM" = "screen" ]]; then
        red $(bold "[SCREEN]")
    fi
}

block_term() {
    if [[ "$TERM" = "screen" ]]; then
        yellow "[${TERM}]"
    fi
}

block_php() {
    local version=$(php -r 'echo phpversion();')
    echo "[PHP: $version]"
}

block_ruby() {
    local version=$(ruby -v | awk '{print $2}')
    echo "[Ruby: $version]"
}

block_python() {
    local version=$(python --version 2>&1 | awk '{print $2}')
    local env=$([[ -v VIRTUAL_ENV ]] && echo venv || echo system)

    echo "[Python: $version ($env)]"
}

block_timestamp() {
    local time=$(date +%k:%M:%S)

    bold "[$time]"
}

block_path() {
    echo "[\w]"
}

block_host() {
    if [[ "$(hostname)" != "$WORK_HOST" ]]; then
        echo "[\h]"
    fi
}

block_user() {
    local user=$(whoami)

    if [[ "$user" == "root" ]]; then
        red $(bold "[ROOT]")
    elif [[ "$user" != "$MY_USERNAME" ]]; then
        echo "[\u]"
    fi
}

block_git() {
    local git_branch=$(
        git branch --no-color 2> /dev/null | sed \
            -e '/^[^*]/d' \
            -e 's/* \(.*\)/[\1]/'
    )

    echo "\[\033[0;32m\]$git_branch\[\033[0m\]"
}

yellow() {
    echo "\[\033[93m$1\033[0m\]"
}

red() {
    echo "\[\033[91m\]$1\[\033[0m\]"
}

bold() {
    echo "\[\033[1m\]$1\[\033[0m\]"
}

################################################################################
# THE PROMPT
################################################################################
prompt_command() {
    local term_lines=$(tput lines)
    local term_cols=$(tput cols)

    PS1=""

    # Exit Bar
    if [[ "$PROMPT_EXITBAR" == "1" ]]; then
        PS1="${PS1}$(exit_bar)"
    fi

    # Command Space
    for i in $(seq 2); do
        PS1="$PS1\n"
    done

    # Environment Line
    PS1="${PS1}$(block_term)"
    PS1="${PS1}$(block_user)"
    PS1="${PS1}$(block_host)"
    PS1="${PS1}$(block_path)"
    PS1="${PS1}$(block_git)"
    PS1="$PS1\n"

    # Versions Line
    if [[ "$PROMPT_VERSIONS" == "1" ]]; then
        PS1="${PS1}$(block_php)"
        PS1="${PS1}$(block_ruby)"
        PS1="${PS1}$(block_python)"
        PS1="$PS1\n"
    fi

    # Prompt Line
    if [[ "$PROMPT_CLOCK" == "1" ]]; then
        PS1="${PS1}$(block_timestamp)"
    fi

    # Insert Custom Directory Prompt
    if [[ -f "$(pwd)/.ps1" ]]; then
        PS1="${PS1}$(source "$(pwd)/.ps1")\n"
    fi

    PS1="${PS1}$(bold \$) "

    export PS1
}

PROMPT_COMMAND=prompt_command
