path_prepend() {
  if [[ $# == 0 ]]
  then declare path="$PWD"
  else declare path="$1"
  fi

  [[ ! -d $path ]] && return

  export PATH="$path:$PATH"
}

path_append() {
  if [[ $# == 0 ]]
  then declare path="$PWD"
  else declare path="$1"
  fi

  [[ ! -d $path ]] && return

  export PATH="$PATH:$path"
}

latest_jetbrains_bin() {
  echo -n $(ls -d /opt/JetBrains/$1-* | sort | tail -n 1)
  echo -n "/bin"
}

path_prepend "/opt/arduino-1.8.5/"

# Dot Bin
path_prepend "$DOT_DIR/bin"

# Python Pip
path_append "$HOME/.local/bin"

# PHP Composer
path_append "$HOME/.config/composer/vendor/bin"

# JetBrains IDEs
if [[ -d /opt/JetBrains ]]
then
  path_append $(latest_jetbrains_bin DataGrip)
  path_append $(latest_jetbrains_bin pycharm)
  path_append $(latest_jetbrains_bin GoLand)
  path_append $(latest_jetbrains_bin clion)
fi

path_append "$HOME/.gloo/bin"
