{ pkgs, theme, ... }:
let
  colors = theme;
in
{
  home.sessionVariables = {
    FZF_DEFAULT_OPTS = "--color=bg+:${colors.base},bg:${colors.base},spinner:${colors.gold},hl:${colors.rose} --color=fg:${colors.text},header:${colors.pine},info:${colors.foam},pointer:${colors.iris} --color=marker:${colors.love},fg+:${colors.text},prompt:${colors.foam},hl+:${colors.rose}";
    DIRENV_LOG_FORMAT = "";
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
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    # This replaces the need for a manual .direnvrc file
    config = {
      global = {
        # This is the 'Nuclear Option' for silence
        load_dotenv = true;
      };
    };
    # This sets the environment variable to silence the "export +" noise
    stdlib = ''
      export DIRENV_LOG_FORMAT=""
    '';
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
      rebuild = "sudo nixos-rebuild switch --flake ~/nixos#think && notify-send \"Rebuild\" \"Finished rebuilding NixOS configuration\" -u normal";
      v = "nvim";
    };

    initContent = ''
      		source <(fzf --zsh)
      		'';
    sessionVariables = {
      DIRENV_LOG_FORMAT = "";
    };
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
}
