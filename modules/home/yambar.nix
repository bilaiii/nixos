{ pkgs, theme, ... }:
let
  yambarize = color: "${builtins.substring 1 (-1) color}ff";
	colors = pkgs.lib.mapAttrs (name: value: yambarize value) theme;
  divider = {
    label = {
      content = {
        string = {
          text = "::";
        };
      };
    };
  };
  mkTag =
    id:
    let
      sid = toString id;
    in
    {
      map = {
        default = {
          string = {
            text = "·";
            foreground = colors.muted;
          };
        };
        conditions = {
          "tag_${sid}_act == 1" = {
            string = {
              text = "✦";
              foreground = colors.rose;
              deco = {
                underline = {
                  size = 2;
                  color = colors.rose;
                };
              };
            };
          };
          "tag_${sid}_urg == 1" = {
            string = {
              text = "*";
              foreground = colors.love;
            };
          };
          "tag_${sid}_pop == 1" = {
            string = {
              text = "⋄";
              foreground = colors.text;
            };
          };
        };
        on-click = "mmsg -t ${sid}";
      };
    };
in
{

  programs.yambar = {
    enable = true;
    settings = {
      bar = {
        height = 16;
        location = "top";
        background = colors.base;
        foreground = colors.subtle;
        spacing = 2;
        margin = 4;
        font = "Cozette";
        left = [
          {
            clock = {
              content = {
                string = {
                  text = "{time}";
                  foreground = colors.text;
                };
              };
            };
          }
          divider
          {
            script = {
              path = "${../../dotfiles/yambar/layout.sh}";
              content.string.text = "{layout}";
            };
          }
          divider
          {
            script = {
              path = "${../../dotfiles/yambar/mango.sh}";
              content.list.items = map mkTag (pkgs.lib.range 1 9);
            };
          }
        ];
        right = [
          {
            pipewire = {
              content = {
                map = {
                  default = {
                    string = {
                      text = "";
                    };
                  };
                  conditions = {
                    "type == sink" = {
                      string = {
                        text = " {cubic_volume}%";
                        foreground = colors.love;
                      };
                    };
                  };
                };
              };
            };
          }
          divider
          {
            network = {
              content = {
                map = {
                  default = {
                    string = {
                      text = "";
                      foreground = colors.rose;
                    };
                  };
                  conditions = {
                    "name == wlp3s0" = {
                      string = {
                        text = " {quality}%";
                        foreground = colors.rose;
                      };
                    };
                  };
                };
              };
            };
          }
          divider
          {
            backlight = {
              name = "amdgpu_bl1";
              content = {
                string = {
                  text = " {percent}%";
                  foreground = colors.gold;
                };
              };
            };
          }
          divider
          {
            battery = {
              name = "BAT0";
              poll-interval = 15000;
              content = {
                map = {
                  # Map MUST have a default particle
                  default = {
                    string = {
                      text = " {capacity}%";
                      foreground = colors.pine;
                    };
                  };
                  conditions = {
                    "state == charging" = {
                      string = {
                        text = " {capacity}%";
                        foreground = colors.pine;
                      };
                    };
                    "state == full" = {
                      string = {
                        text = " {capacity}%";
                        foreground = colors.foam;
                      };
                    };
                    "capacity <= 15" = {
                      string = {
                        text = " {capacity}%";
                        foreground = colors.love;
                      };
                    };
                    "capacity <= 30" = {
                      string = {
                        text = " {capacity}%";
                        foreground = colors.gold;
                      };
                    };
                  };
                };
              };
            };
          }
        ];
      };
    };
  };
}
