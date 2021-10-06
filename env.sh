if [[ -f $HOME/Development/mduk/BashPlayground/var-dump.sh ]]
then source $HOME/Development/mduk/BashPlayground/var-dump.sh
fi

export ESP_DIR="$HOME/.arduino15/packages/esp8266/hardware/esp8266/2.5.2/"

# Declare the location of my general Development directory
export DEV_DIR="$HOME/Development"


# Default editor should always be vim
export EDITOR="vim"
export VISUAL="vim"

export REACT_EDITOR="vim"


# Don't want Python VirtualEnv's default prompt modification
# I'll take care of that myself in ps1.sh
export VIRTUAL_ENV_DISABLE_PROMPT=1


# Enable Chruby if installed
if [[ -f /usr/local/share/chruby/chruby.sh ]]
then source /usr/local/share/chruby/chruby.sh
fi


# Hardware
case "$(hostname)" in
  eddie)
    export WIFI_INTERFACE='wlp59s0'
    export XINPUT_TOUCHSCREEN='Wacom HID 488E Finger'
    export XRANDR_INTERNAL='eDP-1'
    export XRANDR_HDMI='DP-3'
    export SYS_DISPLAY_INTERNAL='/sys/class/drm/card0-eDP-1'
    export SYS_DISPLAY_EXTERNAL='/sys/class/drm/card0-DP-3'
    ;;

  queeg)
    export WIFI_INTERFACE='wlp3s0'
    export XINPUT_TOUCHSCREEN=''
    export XRANDR_INTERNAL='LVDS-1'
    export XRANDR_HDMI='DP-1'
    export SYS_DISPLAY_INTERNAL='/sys/class/drm/card0-LVDS-1'
    export SYS_DISPLAY_EXTERNAL='/sys/class/drm/card0-DP-1'
    ;;

esac


# Appearance
export DMENU_FONT='fixed:pixelsize=32'
export GTK_THEME='Adwaita-dark'
export QT_STYLE_OVERRIDE='Adwaita-dark'
export TERM="xterm-256color"

if [[ $(hostname) == eddie ]]
then
  export QT_AUTO_SCREEN_SCALE_FACTOR='true'
  export QT_SCALE_FACTOR='1.5'
fi

shopt -s autocd

export GR="1.61803398875"

if [[ -f "$HOME/.dotfiles/env_client.sh" ]]
then source "$HOME/.dotfiles/env_client.sh"
fi
