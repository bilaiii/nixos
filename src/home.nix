let
  base = "#191724";
  surface = "#1f1d2e";
  overlay = "#26233a";
  muted = "#6e6a86";
  subtle = "#908caa";
  text = "#e0def4";
  love = "#eb6f92";
  gold = "#f6c177";
  rose = "#ebbcba";
  pine = "#31748f";
  foam = "#9ccfd8";
  iris = "#c4a7e7";

  divider = {
    label = {
      content = {
        string = {
          text = "::";
        };
      };
    };
  };
  yambarize = color: "${builtins.substring 1 (-1) color}ff";
in

let
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
            foreground = yambarize muted;
          };
        };
        conditions = {
          "tag_${sid}_act == 1" = {
            string = {
              text = "✦";
              foreground = yambarize rose;
              deco = {
                underline = {
                  size = 2;
                  color = yambarize rose;
                };
              };
            };
          };
          "tag_${sid}_urg == 1" = {
            string = {
              text = "*";
              foreground = yambarize love;
            };
          };
          "tag_${sid}_pop == 1" = {
            string = {
              text = "⋄";
              foreground = yambarize text;
            };
          };
        };
        on-click = "mmsg -t ${sid}";
      };
    };
in

{ pkgs, ... }:
{
  home.username = "bilaii";
  home.homeDirectory = "/home/bilaii";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  home.sessionVariables = {
    FZF_DEFAULT_OPTS = "--color=bg+:${base},bg:${base},spinner:${gold},hl:${rose} --color=fg:${text},header:${pine},info:${foam},pointer:${iris} --color=marker:${love},fg+:${text},prompt:${foam},hl+:${rose}";
  };

  xdg.configFile."mango" = {
    source = ../configs/mango;
    recursive = true;
  };
  xdg.configFile."mango/autostart.sh" = {
    source = ../configs/mango/autostart.sh;
    executable = true;
  };

  programs.yambar = {
    enable = true;
    settings = {
      bar = {
        height = 15;
        location = "top";
        background = yambarize base;
        foreground = yambarize subtle;
        spacing = 4;
        margin = 3;
        font = "Cozette";
        left = [
          {
            clock = {
              content = {
                list = {
                  items = [
                    {
                      string = {
                        text = "{date}";
                      };
                    }
                    {
                      string = {
                        text = "{time}";
                        foreground = yambarize text;
                      };
                    }
                  ];
                };
              };
            };
          }
          divider
          {
            script = {
              path = "${../configs/yambar/layout.sh}";
              content = {
                string = {
                  text = "{layout}";
                };
              };
            };
          }
          divider
          {
            script = {
              path = "${../configs/yambar/mango.sh}";
              content = {
                list = {
                  # Use map to generate 1 through 9
                  items = map mkTag [
                    1
                    2
                    3
                    4
                    5
                    6
                    7
                    8
                    9
                  ];
                };
              };
            };
          }

        ];
      };
    };
  };
  services.mako = {
    enable = true;
    settings = {
      anchor = "bottom-left";
      layer = "overlay";
      max-visible = 3;
      default-timeout = 8000;
      font = "Cozette 11";
      padding = "6";
      outer-margin = "12,0";
      icon-location = "left";
      border-color = rose;
      border-size = 1;
      background-color = overlay;
      text-color = text;
    };
  };
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user = {
        name = "bilaii";
        email = "skywalker.lyub@gmail.com";
      };
      init = {
        defaultBranch = "main";
      };
    };
  };
  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "eza";
      cat = "bat";
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos/src#nixos";
      v = "nvim";
    };

    initContent = ''
      		source <(fzf --zsh)
      		'';
  };
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
    };
  };
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [
      "--cmd cd"
    ];
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    historyWidgetOptions = [
      "--sort"
      "--exact"
      "--preview 'echo {}' --preview-window down:3:wrap"
    ];
  };
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "Rose Pine";
      window-theme = "ghostty";
      font-family = "Cozette";
      font-size = 22;
      window-title-font-family = "Cozette";
      window-padding-x = 2;
      window-padding-y = 2;
      window-decoration = "none";
      adw-toolbar-style = "flat";
      gtk-wide-tabs = false;
      unfocused-split-opacity = 1;
      split-divider-color = "#ebbcba";
      gtk-single-instance = true;
      quit-after-last-window-closed = false;
      window-inherit-working-directory = false;
      working-directory = "home";
      keybind = [
        "ctrl+shift+enter=new_split"
        "ctrl+shift+f=toggle_split_zoom"
        "ctrl+shift+w=close_surface"

        "ctrl+shift+arrow_down=resize_split:down,10"
        "ctrl+shift+arrow_left=resize_split:left,10"
        "ctrl+shift+arrow_right=resize_split:right,10"
        "ctrl+shift+arrow_up=resize_split:up,10"
        "ctrl+shift+bracket_left=goto_split:previous"
        "ctrl+shift+bracket_right=goto_split:next"

        "ctrl+equal=set_font_size:22"
        "ctrl+minus=set_font_size:11"
      ];
      custom-shader = "${../configs/ghostty/cursor_warp.glsl}";
      gtk-custom-css = "${../configs/ghostty/tabs.css}";
    };
  };

  home.packages = with pkgs; [
    vesktop
    ayugram-desktop
    qutebrowser
    zathura
  ];
}
