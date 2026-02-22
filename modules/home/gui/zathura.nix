{theme, ...}: {
  programs.zathura = {
    enable = true;
    options = with theme; {
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
}
