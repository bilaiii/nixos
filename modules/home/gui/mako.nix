{theme, ...}: {
  services.mako = {
    enable = true;
    settings = with theme; {
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
    extraConfig = ''
      [mode=do-not-disturb]
      invisible=1
    '';
  };
}
