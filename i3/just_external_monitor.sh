

IN="eDP1"
DPEXT="DP1"
HDEXT="HDMI1"

if (xrandr | grep "$DPEXT connected"); then
  /usr/bin/xrandr --output $IN --off --primary --output $DPEXT --auto --right-of $IN
elif (xrandr | grep "$HDEX connected"); then
  /usr/bin/xrandr --output $IN --off --primary --output $HDEXT --auto --right-of $IN
else
  /usr/bin/xrandr --output $IN --auto --output $DPEXT --off
fi
