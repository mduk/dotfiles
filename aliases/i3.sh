alias ei3="e ~/.config/i3/config"

i3-save() {
    i3-save-tree --workspace $1 "$HOME/.config/i3/workspace-$1.json"
}

i3-arrange() {
    i3-msg "workspace $1; append_layout $HOME/.config/i3/workspace-$1.json"
}
