{pkgs, ...}: {
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
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "git.pupgirl.link" = {
        hostname = "git.pupgirl.link";
        user = "git";
        identityFile = "~/.ssh/id_ed25519";
      };
    };
  };
}
