{ pkgs, config, inputs, ... }: {
  imports = [
    ./options.nix
    ./keymaps.nix
    ./plugins.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      fff
      ripgrep
      fd
      wl-clipboard
      alejandra
			gcc
    ];
  };
}
