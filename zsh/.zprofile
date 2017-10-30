#exec xinput set-button-map 12 1 0 3 4 5 6 7
#exec setxkbmap -option compose:ralt

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi
