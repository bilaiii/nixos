{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      # Visuals
      web-devicons.enable = true;

      lualine = {
        enable = true;
        settings = {
          options = {
            icons_enabled = false;
            theme = "rose-pine";
            component_separators = {
              left = "::";
              right = "::";
            };
            section_separators = {
              left = "";
              right = "";
            };
          };
        };
      };

      indent-blankline = {
        enable = true;
        settings.indent.char = "┊";
      };

      todo-comments.enable = true;
      twilight.enable = true;
      which-key.enable = true;

      # Treesitter
      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = false; # You had this disabled in lua
          ensure_installed = [
            "typst"
            "lua"
            "python"
            "rust"
            "html"
            "css"
            "javascript"
            "gdscript"
            "nix"
            "scss"
          ];
        };
        folding = true;
      };

      # Mini.nvim (The heavy lifter)
      mini = {
        enable = true;
        modules = {
          cursorword = {};
          tabline = {};
          surround = {};
          comment = {};
          bracketed = {};
          jump = {};
          files = {};
          pairs = {};
          pick = {};
          extra = {};
          move = {};
          ai = {};
          git = {};
          # Starter (Greeter)
          starter = {
            header = ''
                  ██████    ██████
                ██      ████      ██
              ██  ████      ████    ██
              ██        ██          ██
              ██                    ██
                ██                ██
              ██                    ██
              ██                    ██
                ██    ██    ██    ██
              ██    ████    ████    ██
              ██████  ██    ██  ██████
                        ████
            '';
          };
        };
      };

      # LSP Configuration
      lsp = {
        enable = true;
        servers = {
          lua_ls.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
          cssls.enable = true;
          html.enable = true;
          nixd = {
            enable = true;
            settings = {
              nixpkgs.expr = "import <nixpkgs> {}";
              formatting.command = ["alejandra"];
              options = {
                nixos.expr = "(builtins.getFlake \"/home/bilaii/nixos\").nixosConfigurations.think.options";
              };
            };
          };
          tinymist.enable = true;
          ty.enable = true;
        };
        keymaps.lspBuf = {
          "gd" = "definition";
          "gD" = "references";
          "K" = "hover";
        };
      };

      # Autocomplete (Blink CMP)
      blink-cmp = {
        enable = true;
        settings = {
          keymap.preset = "super-tab";
          completion = {
            ghost_text.enabled = false;
            menu.draw.columns = [
              {__unkeyed-1 = "kind_icon";}
              {__unkeyed-1 = "label";}
              {
                __unkeyed-1 = "label_description";
                gap = 1;
              }
              {
                __unkeyed-1 = "kind";
                gap = 1;
              }
            ];
          };
        };
      };

      # Markdown Rendering
      render-markdown.enable = true;
    };

    # 6. Extra Plugins & Lua Config
    # Plugins that don't have strict NixVim modules yet
    extraPlugins = with pkgs.vimPlugins; [
      fff-nvim
      nvim-highlight-colors
      tiny-glimmer-nvim
      tiny-devicons-auto-colors-nvim
      cord-nvim
      typst-preview-nvim
    ];

    extraConfigLua = ''
      -- Custom Fold Text
      function _G.CustomFoldText()
        return vim.fn.getline(vim.v.foldstart) .. ' ... ' .. vim.fn.getline(vim.v.foldend):gsub("^%s*", "")
      end
      vim.opt.foldtext = 'v:lua.CustomFoldText()'

      -- FFF Setup
      require('fff').setup {
        prompt = 'fffind: '
      }

      -- Highlight Colors
      require('nvim-highlight-colors').setup({
        render = 'background',
        enable_hex = true,
        enable_short_hex = true,
        enable_named_colors = true,
      })

      -- Tiny Glimmer
      require('tiny-glimmer').setup({
        overwrite = {
          undo = {enabled = true},
          redo = {enabled = true}
        }
      })

      -- Auto Colors for Devicons
      require('tiny-devicons-auto-colors').setup()

      -- Cord (Discord RPC)
      require('cord').setup()

      -- Typst Preview
      require("typst-preview").setup({})
    '';
  };
}
