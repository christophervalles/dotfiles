#!/usr/bin/env zsh

level=`cat /sys/class/backlight/intel_backlight/brightness`
max_level=`cat /sys/class/backlight/intel_backlight/max_brightness`

# Convert to percent
echo $((level*100/max_level))
