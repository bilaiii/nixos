{
  theme,
  lib,
  ...
}: let
  fuzzelify = color: (lib.removePrefix "#" color) + "ff";
  colors = lib.mapAttrs (name: value: fuzzelify value) theme;
in {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "Cozette:pixelsize=11";
        prompt = "\"✦ \"";
        terminal = "ghostty -e {cmd}";
        lines = 6;
        minimal-lines = true;
        auto-select = true;
        width = 40;
        horizontal-pad = 8;
        vertical-pad = 8;
        inner-pad = 2;
        icons-enabled = false;
      };
      colors = with colors; {
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
