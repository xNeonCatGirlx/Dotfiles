#!/bin/bash
BATTERY="/sys/class/power_supply/macsmc-battery/power_now"
if [[ -f $BATTERY ]]; then
    power_uw=$(cat "$BATTERY")
    # Convert to Watts (microwatts to watts)
    power_w=$(awk "BEGIN {printf \"%.2f\", $power_uw/1000000}")
    # Show icon and W, remove negative sign for simplicity
    echo "⚡ ${power_w} W"
else
    echo "N/A"
fi
