{
  pkgs,
  theme,
  ...
}: let
  colors = theme;
in {
  home.sessionVariables = {
    FZF_DEFAULT_OPTS = "--color=bg+:${colors.base},bg:${colors.base},spinner:${colors.gold},hl:${colors.rose} --color=fg:${colors.text},header:${colors.pine},info:${colors.foam},pointer:${colors.iris} --color=marker:${colors.love},fg+:${colors.text},prompt:${colors.foam},hl+:${colors.rose}";
    DIRENV_LOG_FORMAT = "";
  };
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    config = {
      global = {
        load_dotenv = true;
      };
    };
    stdlib = ''
      export DIRENV_LOG_FORMAT=""
    '';
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "eza";
      cat = "bat";
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos#think && notify-send \"Rebuild\" \"Finished rebuilding NixOS configuration\" -u normal";
      update = "nix flake update --flake ~/nixos && sudo nixos-rebuild switch --flake ~/nixos#think && notify-send \"Update\" \"Finished updating flake inputs\" -u normal";
      v = "nvim";
    };

    initContent = ''
      source <(fzf --zsh)
    '';
    sessionVariables = {
      DIRENV_LOG_FORMAT = "";
    };
    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
        file = "share/fzf-tab/fzf-tab.plugin.zsh";
      }
    ];
  };
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
    };
  };
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [
      "--cmd cd"
    ];
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    historyWidgetOptions = [
      "--sort"
      "--exact"
      "--preview 'echo {}' --preview-window down:3:wrap"
    ];
  };
  home.packages = with pkgs; [
    eza
    bat
    btop
    wiremix
  ];
}
