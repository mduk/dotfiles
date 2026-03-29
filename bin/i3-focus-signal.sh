#!/usr/bin/env bash

window_id=$(i3-msg -t get_tree | jq -r '
  recurse(.nodes[], .floating_nodes[]) | select(.window_properties.class=="Signal") | .id' | head -n 1)

if [ -n "$window_id" ]; then
  i3-msg "[con_id=$window_id] focus"
else
  signal-desktop &
fi

