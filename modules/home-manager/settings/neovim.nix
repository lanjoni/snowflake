{ pkgs, ... }: {
  programs.nixvim = {
    enable = true;

    colorschemes.kanagawa = {
      enable = true;
      colors.theme.all.ui = {
        bg = "#0D1014";
        fg = "#DCD7BA";
      };
      overrides = ''return {
       Normal = { bg = "#0D1014", fg = "#DCD7BA" },
       FoldColumn = { bg = "#16161D" },
       SignColumn = { bg = "#16161D" },
       LineNr = { bg = "#16161D" },
       CursorColumn = { bg = "#16161D" },
       CursorLine = { bg = "#16161D" },
       CursorLineNr = { bg = "#16161D" },
       DiagnosticSignError = { bg = "#16161D" },
       DiagnosticSignWarn = { bg = "#16161D" },
       DiagnosticSignInfo = { bg = "#16161D" },
       DiagnosticSignHint = { bg = "#16161D" },
      }'';
    };

    plugins = {
      nvim-tree.enable = true;
      oil.enable = true;
      diffview.enable = true;
      gitsigns.enable = true;
      gitlinker.enable = true;
      conjure.enable = true;
      telescope.enable = true;
      presence-nvim.enable = true;
      copilot-vim.enable = true;
      lualine = {
        enable = true;
        extensions = ["nvim-tree" "fzf" "fugitive"];
        iconsEnabled = false;
        globalstatus = true;
        disabledFiletypes.statusline = ["DiffviewFiles" "fzf" "DiffviewFileHistory"];
        sectionSeparators = {
          left = "";
          right = "";
        };
        sections = {
          lualine_a = ["mode"];
          lualine_b = [];
          lualine_c = [
            "filename"
            {
              color = {
                bg = "#16161D";
              };
            }
          ];
          lualine_x = [
            "filetype"
            {
              color = {
                bg = "#16161D";
              };
            }
          ];
          lualine_y = ["diff" "branch"];
        };
     };
    };

    keymaps = [
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>fg";
      }
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<C-p>";
      }
      {
        action = "<cmd>NvimTreeFindfile<CR>";
        key = "<c-n>";
      }
      {
        action = "<cmd>NvimTreeToggle<CR>";
        key = "<leader>n";
      }
    ];

    extraPlugins = with pkgs.vimPlugins; [
      {
        plugin = vim-dispatch;
      }
      {
        plugin = vim-jack-in;
      }
      {
        plugin = vim-dispatch-neovim;
      }
      {
        plugin = mason-nvim;
        config = "lua require('mason').setup()";
      }
    ];

    plugins.lsp = {
      enable = true;

      servers = {
        tsserver.enable = true;
        gopls.enable = true;
        elixirls.enable = true;
        clojure-lsp.enable = true;
        nixd.enable = true;

        lua-ls = {
          enable = true;
          settings.telemetry.enable = false;
        };
      };

      keymaps = {
        silent = true;
        lspBuf = {
          K = "hover";
          gd = "definition";
          gD = "declaration";
          gi = "implementation";
        };
      };
    };

    options = {
      expandtab = true;
      number = true;
      relativenumber = true;
      clipboard = "unnamedplus";
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
    };

    globals.mapleader = " ";
    globals.maplocalleader = ",";
  };
}
