{theme, ...}: {
  services.flameshot = {
    enable = true;
    settings = {
      General = with theme; {
        useGrimAdapter = true;
        disabledGrimWarning = true;
        uiColor = rose;
        contrastUiColor = base;
        showHelp = false;
      };
    };
  };
}
