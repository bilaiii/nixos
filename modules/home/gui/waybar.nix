{
  config,
  pkgs,
  theme,
  ...
}: let
  s = "custom/separator";
in {
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {
      main = {
        layer = "top";
        position = "left";
        spacing = 4;

        modules-left = ["clock" s "ext/workspaces"];
				# modules-center = ["custom/gay"];
        modules-right = ["pulseaudio" "network" "backlight" "battery" s "group/tray-container" s "group/power-menu"];
        "${s}" = {
          format = "::";
          tooltip = false;
        };
        "clock" = {
          format = "{:%H\n%M}";
        };
				"battery" = {
					format = "{icon}";
					states = { warning = 30; critical = 15; };
					format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
					format-unknown = "󰂑";
					format-not-charging = "󰂄";
				};
				"backlight" = {
					format = "{icon}";
					format-icons = ["◌" "○" "◎" "◉" "⚉"];
				};
				"network" = {
					format-wifi = "";
					format-ethernet = "";
					format-disabled = "✕";
					format-disconected = "⌀";
				};
				"pulseaudio" = {
					format = "{icon}";
					format-muted = "婢";
					format-icons = {
						headphone = "";
						headset = "";
						default = ["" "" ""];
					};
				};
				"group/tray-container" = {
					orientation = "inherit";
					modules = ["custom/chevron" "tray"];
					drawer = {
						transition-duration = 300;
						transition-left-to-right = false;
						click-to-reveal = true;
					};
				};
				"custom/chevron" = {
					format = "⏶";
					tooltip-format = "Open tray";
				};
				"tray" = {
					icon-size = 11;
					spacing = 4;
				};
				"group/power-menu" = {
					orientation = "inherit";
					modules = ["custom/shutdown" "custom/reboot" "custom/hibernate" "custom/suspend"];
					drawer = {
						transition-duration = 300;
						transition-left-to-right = false;
						click-to-reveal = false;
					};
				};
				"custom/shutdown" = {
					format = "⏻";
					tooltip-format = "Shutdown";
					on-click = "shutdown now";
				};
				"custom/reboot" = {
					format = "↺";
					tooltip-format = "Reboot";
					on-click = "systemctl reboot";
				};
				"custom/hibernate" = {
					format = "✱";
					tooltip-format = "Hibernate (deep sleep)";
					on-click = "systemctl hibernate";
				};
				"custom/suspend" = {
					format = "⏾";
					tooltip-format = "Suspend (sleep)";
					on-click = "systemctl suspend";
				};
				"custom/gay" = {
					format = "  ";
					tooltip = false;
				};
      };
    };
    style = ''
      * {
				padding: 0;
      	margin: 0;
				border-radius: 0;
      }
			window#waybar {
				background-color: ${theme.base};
				color: ${theme.text};
			}		
    	#custom-separator {
      	color: ${theme.subtle};
    	}
			#workspaces button {
				transition: 0s;
			}
			#workspaces button.empty {
				color: ${theme.subtle};
			}
			#workspaces button.active {
				color: ${theme.base};
				background-color: ${theme.rose}
			}
			#workspaces button.urgent {
				color: ${theme.love};
				background-color: ${theme.base};
				border-right: 2px solid ${theme.love};
			}
			#workspaces button.urgent.active {
				color: ${theme.base};
				background-color: ${theme.love};
				border-right: none;
			}
			#clock {
				margin-top: 4px;
			}
			#power-menu {
				color: ${theme.love};
				margin-bottom: 4px;
			}
			#battery.charging {
				color: ${theme.pine};
			}
			#battery.not-charging {
				color: ${theme.iris};
			}
			#battery.full {
				color: ${theme.foam};
			}
			#battery.warning {
				color: ${theme.gold};
			}
			#battery.critical {
				color: ${theme.love};
			}
			#backlight {
				color: ${theme.gold};
			}
			#network.disabled {
				color: ${theme.subtle};
			}
			#network.disconnected {
				color: ${theme.love};
			}
			#network.wifi {
				color: ${theme.iris};
			}
			#network.ethernet {
				color: ${theme.iris};
			}
			#pulseaudio.muted {
				color: ${theme.love};
			}
			#pulseaudio {
				color: ${theme.rose};
			}
			#custom-gay {
				min-height: 22px;
				opacity: 0;
				transition: 400ms cubic-bezier(0.40,0.00,0.20,1.00);
			}
			#custom-gay:hover {
				min-height: 110px;
				opacity: 1;
				background-image: linear-gradient(
						to bottom,
						#d7827e 0%,
						#d7827e 20%,
						${theme.rose} 20%,
						${theme.rose} 40%,
						${theme.text} 40%,
						${theme.text} 60%,
						${theme.iris} 60%,
						${theme.iris} 80%,
						#907aa9 80%,
						#907aa9 100%
				);
			}
    '';
  };
}
