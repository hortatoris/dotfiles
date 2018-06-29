#!/usr/bin/env sh

# terminate running bars
killall -q polybar

# wait until all of them are shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# launch new poly
polybar example &
