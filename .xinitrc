export GTK_THEME="adw-gtk3-dark"
export XCURSOR_THEME=Bibata-Modern-Ice
export XCURSOR_SIZE=24
xrandr --output $(xrandr | grep ' connected' | awk '{print $1}' | head -n 1) --scale 0.75x0.75 
xmodmap ~/.Xmodmap &
redshift -x && redshift -P -l 24.47:88.07 -t 4800:4300 &
xrdb -merge ~/.Xresources &
xsetroot -cursor_name left_ptr &
xset s off -dpms &
dunst &
dwmstatus &
feh --no-fehbg --bg-scale $HOME/Pictures/renaissance.png &
exec dwm
