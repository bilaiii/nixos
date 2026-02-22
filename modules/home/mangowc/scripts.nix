{pkgs, ...}: let
  power = pkgs.writeShellScript "power" ''
    option="$(echo -ne "shutdown\nsuspend\nhibernate\nreboot" | ${pkgs.fuzzel}/bin/fuzzel --dmenu)"
    case "$option" in
      shutdown) shutdown now ;;
      suspend) systemctl suspend ;;
      hibernate) systemctl hibernate ;;
      reboot) systemctl reboot ;;
    esac
  '';
in "bind=SUPER,m,spawn,${power}"
