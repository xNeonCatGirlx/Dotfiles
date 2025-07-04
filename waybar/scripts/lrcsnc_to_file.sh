#!/usr/bin/env bash

# This script streams lyrics from lrcsnc for Waybar in interval: 0 mode.
# Waybar will update instantly on each new lyric line.

# You may want to kill any old background lrcsnc (optional, uncomment if needed)
# pkill -f lrcsnc

# Just run lrcsnc directly and forward each line to stdout for Waybar
lrcsnc | while read -r line; do
    # Remove any ANSI color codes just in case (optional)
    clean_line="$(echo "$line" | sed 's/\x1b\[[0-9;]*m//g')"
    echo "$clean_line"
    # If you want to add any formatting, you can do it here
done

