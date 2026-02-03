#! /usr/bin/env bash

option="$(echo -ne "shutdown\nsuspend\nsleep\nhibernate" | $DMENU)"
case "$option" in
	shutdown) shutdown now ;;
	suspend) systemctl suspend ;;
	hibernate) systemctl hibernate ;;
	reboot) systemctl reboot ;;
	*) exit 0 ;;
esac
