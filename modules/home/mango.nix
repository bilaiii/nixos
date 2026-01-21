{ pkgs, theme, ... }:
let
	colors = theme;
  yambarize = color: "${builtins.substring 1 (-1) color}ff";
	fuzzelColors = pkgs.lib.mapAttrs (name: value: yambarize value) theme;
in{
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.rose-pine-cursor;
    name = "BreezeX-RosePine-Linux";
    size = 24;
  };

  home.sessionVariables = {
    XCURSOR_THEME = "BreezeX-RosePine-Linux";
    XCURSOR_SIZE = "24";
  };

  xdg.configFile."mango" = {
    source = ../../dotfiles/mango;
    recursive = true;
  };
  xdg.configFile."mango/autostart.sh" = {
    source = ../../dotfiles/mango/autostart.sh;
    executable = true;
  };

  services.mako = {
    enable = true;
    settings = with colors; {
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
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "Cozette:pixelsize=11";
        prompt = "\"✦ \"";
        terminal = "ghostty -e {cmd}";
        lines = "6";
        minimal-lines = true;
        auto-select = true;
        width = 40;
        horizontal-pad = 8;
        vertical-pad = 8;
        inner-pad = 2;
        icons-enabled = false;
      };
      colors = with fuzzelColors; {
        background = base;
        text = muted;
        match = text;
        selection = rose;
        selection-text = base;
        border = rose;
        prompt = rose;
        input = text;
        placeholder = muted;
        selection-match = base;
        counter = muted;
      };
      border = {
        width = 1;
        radius = 0;
      };
    };
  };
	}
