{ pkgs, ... }:
{
  home.username = "bilaii";
  home.homeDirectory = "/home/bilaii";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  xdg.configFile."mango" = {
    source = ../configs/mango;
    recursive = true;
  };
  xdg.configFile."mango/autostart.sh" = {
    source = ../configs/mango/autostart.sh;
    executable = true;
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
  };
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
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
