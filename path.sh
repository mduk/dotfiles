path_prepend() {
  [[ ! -d $1 ]] && return
  export PATH="$1:$PATH"
}

path_append() {
  [[ ! -d $1 ]] && return
  export PATH="$PATH:$1"
}

latest_jetbrains_bin() {
  echo -n $(ls -d /opt/JetBrains/$1-* | sort | tail -n 1)
  echo -n "/bin"
}

# Home bin overrides everything
path_prepend "$HOME/bin"

# Python Pip
path_append "$HOME/.local/bin"

# PHP Composer
path_append "$HOME/.config/composer/vendor/bin"

# JetBrains IDEs
if [[ -d /opt/JetBrains ]]
then
  path_append $(latest_jetbrains_bin DataGrip)
  path_append $(latest_jetbrains_bin PhpStorm)
  path_append $(latest_jetbrains_bin RubyMine)
  path_append $(latest_jetbrains_bin WebStorm)
  path_append $(latest_jetbrains_bin pycharm)
  path_append $(latest_jetbrains_bin idea-IU)
fi
