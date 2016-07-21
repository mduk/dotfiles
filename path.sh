# Add .local/bin/ to PATH
export PATH="$PATH:$HOME/.local/bin"

# Add the Composer bin/ to PATH
export PATH="$PATH:$HOME/.composer/vendor/bin"

# Add my personal bin/ to the front of the PATH, overriding everything else
export PATH="$HOME/bin/:$PATH"
