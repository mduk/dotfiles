MY_USERNAME="daniel"

declare PROMPT_BAR=true
declare PROMPT_SPACE=2
declare PROMPT_HOMETIME="17:30"

declare PROMPT_GREEN="\033[92m"
declare PROMPT_YELLOW="\033[93m"
declare PROMPT_RED="\033[91m"
declare PROMPT_BOLD="\033[1m"
declare PROMPT_RESET="\033[0m"

declare -ag PROMPT_BLOCKS=(
  'user host screen'
  'python'
  'path git'
  'clock prompt'
)

mini() {
  PROMPT_SPACE=0
  PROMPT_BAR=false
}

unprompt() {
  unset PROMPT_COMMAND
  unset -f prompt_command
  export PS1="[\u@\h]\$ "
}

exit_bar() {
  echo "\033[48;5;\$([[ \$? -gt 0 ]] && echo \"88\" || echo \"22\")m\033[K\033[0m"
}

block_wifi() {
  echo "[$(wifi-ssid)]"
}

block_php() {
  if ! which php &>/dev/null
  then
    echo "[PHP: X]"
    return
  fi

  echo "[PHP: $(php -r 'echo phpversion();')]"
}

block_ruby() {
  if ! which ruby &>/dev/null
  then
    echo "[Ruby: X]"
    return
  fi

  echo "[Ruby: $(ruby -v | awk '{print $2}')]"
}

block_python() {
  if ! which python &>/dev/null
  then
    echo "[Python: X]"
    return
  fi

  declare version=$(python --version 2>&1 | awk '{print $2}')
  declare env=$([[ -v VIRTUAL_ENV ]] && echo venv || echo system)
  echo "[Python: $version ($env)]"
}

block_clock() {
  if [[ $(date --date="$PROMPT_HOMETIME" +%s) -le $(date +%s) ]] && [[ ! "$(wifi-ssid)" -eq "VM9243984" ]]
  then echo -e "$PROMPT_RED[$(date +%H:%M:%S)]"
  else echo -e "$PROMPT_BOLD[$(date +%H:%M:%S)]"
  fi
}

block_path() {
  if [[ $PWD != $HOME ]]
  then echo "[${PWD/$HOME/\~}]"
  fi
}

block_screen() {
  if [[ -n $STY ]]
  then echo "[$STY]"
  fi
}

block_host() {
  if [[ ! -z "$SSH_TTY" ]]
  then echo "[$USER@$(hostname)]"
  fi
}

block_user() {
  local user=$(whoami)

  if [[ "$user" == "root" ]]
  then echo "$PROMPT_RED[ROOT]"
  elif [[ "$user" != "$MY_USERNAME" ]]
  then echo "${PROMPT_YELLOW}[${USER}]"
  fi
}

block_git() {
  local git_branch=$(
      git branch --no-color 2> /dev/null \
        | sed -n '/^* /s///p'
  )

  if [[ -n $git_branch ]]
  then echo "[$git_branch]"
  fi
}

block_prompt() {
  echo '$ '
}

block_size() {
  echo "[$(tput cols)x$(tput lines)]"
}

block_dirprompt() {
  # Insert Custom Directory Prompt
  if [[ -f "$(pwd)/.ps1" ]]
  then PS1="${PS1}$(source "$(pwd)/.ps1")\n"
  fi
}



################################################################################
# THE PROMPT
################################################################################
prompt_command() {
  CMD_EXIT=$?

  local term_lines=$(tput lines)
  local term_cols=$(tput cols)

  declare -a promptlines=()

  declare promptbar=''
  if [[ $PROMPT_BAR == true ]]
  then promptbar="$(exit_bar)"
  fi

  declare promptspace=''
  for i in $(seq ${PROMPT_SPACE:-$DEFAULT_PROMPT_SPACE})
  do promptspace+=$'\n'
  done

  for line in "${PROMPT_BLOCKS[@]}"
  do
    declare promptline=""
    for block in $line
    do
      declare rendered="$(eval "block_$block")"

      if [[ -z $rendered ]]
      then continue
      fi

      declare joined="${promptline}${rendered}"

      if [[ -n $promptline ]] && [[ ${#joined} -gt $(tput cols) ]]
      then promptline+="${PROMPT_RESET}\n ↪ \[$rendered\]"
      else promptline+="${PROMPT_RESET}\[${rendered}\]"
      fi
    done

    if [[ -n $promptline ]]
    then promptlines+=("$promptline")
    fi
  done

  PS1="${promptbar}${promptspace}\n$(
    local IFS=$'\n'
    echo "${promptlines[*]}"
  )$PROMPT_RESET"

  export PS1
}

PROMPT_COMMAND=prompt_command
