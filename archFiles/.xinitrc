#!/bin/sh
setxkbmap -option caps:escape
#feh --bg-scale $HOME/wallpapers/wall2.jpg &
#feh --bg-fill $HOME/wallpapers/wall22.jpg &
nitrogen --restore
userresources=$HOME/.Xresources
#wall &
udiskie -t &
picom &
xmodmap ~/.Xmodmap 
#xmodmap -e 'clear lock'
numlockx &
pasystray &
nm-applet &
dunst &
sxhkd -c ~/ui/sxhkdrc &
cbatticon &
dwmblocks &
exec dwm
