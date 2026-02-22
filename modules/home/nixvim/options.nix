{...}: {
  programs.nixvim = {
    colorschemes.rose-pine = {
      enable = true;
      settings = {
        variant = "main"; # options: main, moon, dawn
      };
    };

    globals.mapleader = " ";

    opts = {
      swapfile = false;
      # Indentation
      tabstop = 2;
      shiftwidth = 2;
      smartindent = true;
      wrap = false;
      # Visual Aid
      cursorcolumn = false;
      cursorline = true;
      # Search
      ignorecase = true;
      smartcase = true;
      # Gutter
      number = true;
      relativenumber = false;
      signcolumn = "yes";
      # Visuals
      termguicolors = true;
      winborder = "single";
      undofile = true;
      # Folds
      foldmethod = "expr";
      foldexpr = "v:lua.vim.treesitter.foldexpr()";
      foldlevel = 99;
      # Whitespace
      list = false;
      listchars = {
        tab = "» ";
        lead = "·";
      };
    };
  };
}
