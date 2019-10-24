MY_USERNAME="daniel"

declare PROMPT_GIT=true
declare PROMPT_PATH=true
declare PROMPT_HOST=true
declare PROMPT_VERSIONS=false
declare PROMPT_CLOCK=true
declare PROMPT_BAR=true
declare PROMPT_SPACE=2

mini() {
  PROMPT_SPACE=0
  PROMPT_BAR=false
  PROMPT_VERSIONS=false
  PROMPT_CLOCK=false
  PROMPT_GIT=false
}

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

block_wifi() {
  echo "[$(wifi-ssid)]"
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
    echo "$PROMPT_VERSIONS" | grep "php" > /dev/null
    if [ $? -eq 0 ]
    then
        local version=$(php -r 'echo phpversion();')
        echo "[PHP: $version]"
    fi
}

block_ruby() {
    echo "$PROMPT_VERSIONS" | grep "ruby" > /dev/null
    if [ $? -eq 0 ]
    then
        local version=$(ruby -v | awk '{print $2}')
        echo "[Ruby: $version]"
    fi
}

block_python() {
    echo "$PROMPT_VERSIONS" | grep "python" > /dev/null
    if [ $? -eq 0 ]
    then
        local version=$(python --version 2>&1 | awk '{print $2}')
        local env=$([[ -v VIRTUAL_ENV ]] && echo venv || echo system)
        echo "[Python: $version ($env)]"
    fi
}

block_clock() {
    local time=$(date +%H:%M:%S)

    bold "[$time]"
}

block_path() {
  [[ $PROMPT_PATH == true ]] && echo "[\w]"
}

block_host() {
    if [[ ! -z "$SSH_TTY" ]]; then
      yellow "[$USER@$(hostname)]"
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
  if [[ $PROMPT_GIT == true ]]
  then
    local git_branch=$(
        git branch --no-color 2> /dev/null | sed \
            -e '/^[^*]/d' \
            -e 's/* \(.*\)/[\1]/'
    )

    echo "\[\033[0;32m\]$git_branch\[\033[0m\]"
  fi
}

green() {
    echo "\[\033[92m$1\033[0m\]"
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
    CMD_EXIT=$?
    local term_lines=$(tput lines)
    local term_cols=$(tput cols)

    PS1=""

    # Exit Bar
    if [[ $PROMPT_BAR == true ]]; then
        PS1="${PS1}$(exit_bar)"
    fi

    # Command Space
    for i in $(seq ${PROMPT_SPACE:-$DEFAULT_PROMPT_SPACE}); do
        PS1="$PS1\n"
    done

    # Environment Line
    PS1="${PS1}$(block_term)"
    PS1="${PS1}$(block_user)"
    PS1="${PS1}$(block_host)"

    # PATH
    if [[ $PROMPT_PATH == true ]] \
    && [[ "$(pwd)" != "$HOME" ]]
    then PS1="${PS1}$(block_path)"
    fi

    # Git
    if [[ $PROMPT_GIT == true ]] \
    && git branch &>/dev/null
    then
      PS1="${PS1}$(block_git)"
    fi


    # Versions Line
    if [[ $PROMPT_VERSIONS != false ]]; then
        PS1="$PS1\n"
        PS1="${PS1}$(block_php)"
        PS1="${PS1}$(block_ruby)"
        PS1="${PS1}$(block_python)"
    fi

    # Prompt Line
    if [[ $PROMPT_CLOCK == true ]]; then
        PS1="$PS1\n"
        PS1="${PS1}$(block_clock)"
    fi

    # Insert Custom Directory Prompt
    if [[ -f "$(pwd)/.ps1" ]]; then
        PS1="${PS1}$(source "$(pwd)/.ps1")\n"
    fi

    PS1="${PS1}$(bold \$) "

    export PS1
}

PROMPT_COMMAND=prompt_command
