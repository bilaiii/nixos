{ pkgs, theme, ... }:
let
	colors = theme;
in
{
  imports = [
    ./modules/home/yambar.nix
    ./modules/home/shell.nix
    ./modules/home/mango.nix
  ];
  home.username = "bilaii";
  home.homeDirectory = "/home/bilaii";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
	services.flameshot = {
		enable = true;
		settings = {
			General = with colors; {
				useGrimAdapter = true;
				disabledGrimWarning = true;
				uiColor = rose;
				contrastUiColor = base;
				showHelp = false;
			};
		};
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
      split-divider-color = colors.rose;
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
      custom-shader = "${./dotfiles/ghostty/cursor_warp.glsl}";
      gtk-custom-css = "${./dotfiles/ghostty/tabs.css}";
    };
  };
  programs.zathura = {
    enable = true;
    options = with colors; {
			database = "sqlite";
			selection-clipboard = "clipboard";
      default-bg = base;
      default-fg = text;

      statusbar-bg = base;
      statusbar-fg = muted;

      inputbar-bg = overlay;
      inputbar-fg = text;

      notification-bg = text;
      notification-fg = base;

      notification-error-bg = love;
      notification-error-fg = base;

      notification-warning-bg = gold;
      notification-warning-fg = base;

      highlight-color = "rgba(235, 188, 186, 0.5)";
      highlight-active-color = "rgba(235, 111, 146, 0.5)";

      completion-bg = overlay;
      completion-fg = rose;

      completion-highlight-fg = base;
      completion-highlight-bg = rose;

      recolor-lightcolor = base;
      recolor-darkcolor = text;

      recolor = true;
      recolor-keephue = true;
      font = "Cozette normal 11";
      guioptions = "";

    };
  };

  xdg.mimeApps.defaultApplications = {
    "application/pdf" = [ "org.pwmt.zathura.desktop" ];
  };

  home.packages = with pkgs; [
    vesktop
    ayugram-desktop
    qutebrowser
    obsidian
		libqalculate
  ];
}
