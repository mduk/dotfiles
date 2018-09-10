# Declare the location of my general Development directory
export DEV_DIR="$HOME/Development"

# Default editor should always be vim
export EDITOR="vim"
export VISUAL="vim"

# Terminal Colours!
export TERM="xterm-256color"

# Don't want Python VirtualEnv's default prompt modification
# I'll take care of that myself in ps1.sh
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Enable Chruby if installed
if [[ -f /usr/local/share/chruby/chruby.sh ]]
then source /usr/local/share/chruby/chruby.sh
fi

export DMENU_FONT='fixed:pixelsize=32'
export QT_AUTO_SCREEN_SCALE_FACTOR=true
export QT_SCALE_FACTOR=1.5
export QT_STYLE_OVERRIDE=Adwaita-dark

