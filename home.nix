{
	inputs,
  pkgs,
  ...
}: let
in {
  imports = [
    ./modules/home/shell.nix
    ./modules/home/mangowc
    ./modules/home/git.nix
		./modules/home/gui
		inputs.nixvim.homeManagerModules.nixvim
		./modules/home/nixvim
  ];
  home.username = "bilaii";
  home.homeDirectory = "/home/bilaii";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
	programs.firefox.enable = true;

  home.packages = with pkgs; [
    vesktop
    ayugram-desktop
    qutebrowser
    obsidian
    libqalculate
  ];
}
