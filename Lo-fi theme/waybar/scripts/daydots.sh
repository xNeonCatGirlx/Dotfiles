#!/bin/bash
# Prints 24 dots, filled for hours that have passed today, empty for the rest

# Unicode characters for filled and empty dots
FILLED="●"
EMPTY="○"

# Get current hour (0-23)
CURRENT_HOUR=$(date +%H)

OUT=""
for ((i=0; i<24; i++)); do
    if (( i < 10 )); then
        # Remove leading zero for easier comparison
        i_num=$((10#$i))
    else
        i_num=$i
    fi
    if (( i_num < 10#$CURRENT_HOUR )); then
        OUT+="$FILLED"
    else
        OUT+="$EMPTY"
    fi
done

# Output as JSON for Waybar
echo  "$OUT" 

