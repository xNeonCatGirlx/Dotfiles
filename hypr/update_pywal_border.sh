#!/bin/bash

# Get pywal colors
WAL_COLORS="$HOME/.cache/wal/colors.json"

# Extract Pywal colors
ACTIVE=$(jq -r '.colors.color7' "$WAL_COLORS")
INACTIVE=$(jq -r '.colors.color0' "$WAL_COLORS")

# Replace colors in hyprland.conf
sed -i -E \
  -e "s|col\.active_border = rgb\([^)]+\)|col.active_border = rgb(${ACTIVE})|" \
  -e "s|col\.inactive_border = rgb\([^)]+\)|col.inactive_border = rgb(${INACTIVE})|" \
  ~/.config/hypr/hyprland.conf

# Reload Hyprland
hyprctl reload

