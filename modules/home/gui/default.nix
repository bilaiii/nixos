{pkgs, ...}: {
  imports = [
    ./waybar.nix
    ./ghostty.nix
    ./fuzzel.nix
    # ./qutebrowser.nix
    ./zathura.nix
    ./mako.nix
    ./flameshot.nix
  ];
  gtk = {
    enable = true;
    theme = {
      name = "rose-pine";
      package = pkgs.rose-pine-gtk-theme;
    };
    iconTheme = {
      name = "rose-pine";
      package = pkgs.rose-pine-icon-theme;
    };
  };
	home.packages = with pkgs; [ qbittorrent ];
}
