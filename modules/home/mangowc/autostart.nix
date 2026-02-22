{pkgs}: let
	script = pkgs.writeShellScript "autostart" ''
    ${pkgs.dbus}/bin/dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

    ${pkgs.mako}/bin/mako &
    ${pkgs.swww}/bin/swww-daemon &
    
    ${pkgs.swww}/bin/swww img /home/bilaii/Pictures/walls/dragon.png &

    ${pkgs.yambar}/bin/yambar &
    ${pkgs.flameshot}/bin/flameshot &

    ${pkgs.wl-clip-persist}/bin/wl-clip-persist --clipboard regular --reconnect-tries 0 &
    ${pkgs.wl-clipboard}/bin/wl-paste --type text --watch ${pkgs.cliphist}/bin/cliphist store &

    ${pkgs.ghostty}/bin/ghostty --initial-window=false &
	'';
in "exec-once=${script}"
