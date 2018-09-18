# Declare the location of my general Development directory
export DEV_DIR="$HOME/Development"


# Default editor should always be vim
export EDITOR="vim"
export VISUAL="vim"


# Don't want Python VirtualEnv's default prompt modification
# I'll take care of that myself in ps1.sh
export VIRTUAL_ENV_DISABLE_PROMPT=1


# Enable Chruby if installed
if [[ -f /usr/local/share/chruby/chruby.sh ]]
then source /usr/local/share/chruby/chruby.sh
fi


# Hardware
export WIFI_INTERFACE='wlp59s0'
export XINPUT_TOUCHSCREEN='Wacom HID 488E Finger'
export XRANDR_INTERNAL='eDP-1'
export XRANDR_HDMI='DP-3'


# Appearance
export DMENU_FONT='fixed:pixelsize=32'
export GTK_THEME='Adwaita-dark'
export QT_STYLE_OVERRIDE='Adwaita-dark'
export QT_AUTO_SCREEN_SCALE_FACTOR='true'
export QT_SCALE_FACTOR='1.5'
export TERM="xterm-256color"
