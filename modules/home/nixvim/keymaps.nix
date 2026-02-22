{...}: {
  programs.nixvim = {
    keymaps = [
      # Standard operations
      {
        mode = "n";
        key = "<leader>o";
        action = "<cmd>update<CR><cmd>source %<CR>";
        options.desc = "Save & Source";
      }
      {
        mode = "n";
        key = "<leader>lf";
        action = "<cmd>lua vim.lsp.buf.format()<CR>";
        options.desc = "Format";
      }
      {
        mode = "n";
        key = "<leader>f";
        action = "<cmd>lua require('fff').find_files()<CR>";
        options.desc = "Find Files";
      }
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>lua MiniFiles.open()<CR>";
        options.desc = "Mini Explorer";
      }
      {
        mode = "n";
        key = "U";
        action = "<cmd>redo<CR>";
        options.desc = "Redo";
      }
      {
        mode = "n";
        key = ",";
        action = "<cmd>noh<CR>";
        options.desc = "Clear Highlights";
      }

      # Helix-like system clipboard yanking
      {
        mode = ["n" "v" "x"];
        key = "<leader>y";
        action = "\"+y";
      }
      {
        mode = ["n" "v" "x"];
        key = "<leader>yy";
        action = "\"+yy";
      }
      {
        mode = ["n" "v" "x"];
        key = "<leader>p";
        action = "\"+p";
      }
      {
        mode = ["n" "v" "x"];
        key = "<leader>P";
        action = "\"+P";
      }

      # Todo Comments
      {
        mode = "n";
        key = "]t";
        action = "<cmd>lua require('todo-comments').jump_next()<CR>";
      }
      {
        mode = "n";
        key = "[t";
        action = "<cmd>lua require('todo-comments').jump_prev()<CR>";
      }
    ];
  };
}
