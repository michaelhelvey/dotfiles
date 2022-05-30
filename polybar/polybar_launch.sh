#!/usr/bin/env bash

killall -q polybar

# Wait for processes to shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

#polybar main_bar -r -c ~/.config/polybar/topbar.ini &

for m in $(polybar --list-monitors | cut -d":" -f1); do
	MONITOR=$m polybar -c ~/.config/polybar/topbar.ini --reload main_bar &
done
