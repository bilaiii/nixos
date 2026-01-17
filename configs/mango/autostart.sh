#! /usr/bin/env bash
set +e
export SWWW_TRANSITION=grow
export SWWW_TRANSITION_FPS=60
export SWWW_TRANSITION_DURATION=0.6
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
mako &
swww-daemon &
swww img /home/bilaii/Pictures/walls/dragon.png &
yambar &

# keep clipboard content
wl-clip-persist --clipboard regular --reconnect-tries 0 &

# clipboard content manager
wl-paste --type text --watch cliphist store & 
ghostty --initial-window=false &
