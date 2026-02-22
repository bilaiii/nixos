{
  pkgs,
  theme,
  config,
  ...
}: let
  mangofy = color: "0x" + (pkgs.lib.removePrefix "#" color) + "ff";
  mangoColors = pkgs.lib.mapAttrs (name: value: mangofy value) theme;
  keys = import ./keys.nix {inherit pkgs mangoColors;};
  looks = import ./looks.nix {inherit mangoColors;};
  options = import ./options.nix;
  scripts = import ./scripts.nix {inherit pkgs config;};
  autostart = import ./autostart.nix {inherit pkgs;};
in {
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.rose-pine-cursor;
    name = "BreezeX-RosePine-Linux";
    size = 24;
  };

  home.sessionVariables = {
    SWWW_TRANSITION = "grow";
    SWWW_TRANSITION_FPS = "60";
    SWWW_TRANSITION_DURATION = "0.6";

    XCURSOR_THEME = "BreezeX-RosePine-Linux";
    XCURSOR_SIZE = "24";

    XDG_CURRENT_DESKTOP = "wlroots";
  };

  home.packages = with pkgs; [
		wayland-logout
    grim
    slurp
    wl-clipboard
    swww
    libnotify
    fuzzel
  ];

  xdg.configFile."mango/config.conf".text = ''
    ${autostart}
    ${options}
    ${looks}
    ${keys}
    ${scripts}
  '';
}
