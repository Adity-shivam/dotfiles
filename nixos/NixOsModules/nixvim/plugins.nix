{ pkgs, inputs, ... }:

let 
  lib = inputs.nixvim.lib;
in

{
  programs.nixvim.plugins = {
    bufferline.enable = true;
   
    alpha = {
      enable = true;
      # autoLoad = true;
      callSetup = true;
      settings = {
          layout = [
            {
              type = "padding";
              val = 2;
            }
            {
              opts = {
                hl = "Type";
                position = "center";
              };
              type = "text";
              val = [
                "███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗"
                "████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║"
                "██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║"
                "██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║"
                "██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║"
                "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
              ];
            }
            {
              type = "padding";
              val = 2;
            }
            {
              type = "group";
              val = [
                {
                  on_press = lib.nixvim.mkRaw "function() vim.cmd[[ene]] end";
                  opts = {
                    shortcut = "n";
                    position = "center";
                  };
                  type = "button";
                  val = "  New file";
                }
                {
                  on_press = lib.nixvim.mkRaw "function() vim.cmd[[qa]] end";
                  opts = {
                    shortcut = "q";
                    position = "center";
                  };
                  type = "button";
                  val = " Quit Neovim";
                }
              ];
            }
            {
              type = "padding";
              val = 2;
            }
            {
              opts = {
                hl = "Keyword";
                position = "center";
              };
              type = "text";
              val = "Inspiring quote here.";
            }
          ];
      };
    };

    bullets = {
      enable = true;
      settings = {
        enable_in_empty_buffers = 0;
        enabled_file_types = [
          "markdown"
          "text"
          #"gitcommit"
          #"scratch"
        ];
        nested_checkboxes = 0; 

      };
    };

    # clangd-extensions.enable = true;
    # cmp | blink | coq
    # comfy-line-number
    # comment vs commentary
    # TODO comments
    # dap debug 
    # intelli indent
    # lint
    # lsp / luasnip
    # mini | autopair | autoclose
    # snacks
    # multi cursors
    # neoclip
    # neorg
    # nerdy
    # nix
    # ufo | fold
    # persistnace | tmux
    # quicker
    # smart colorcolumn
    # transparent
    # twiligh
    # undotree
    # visual whitespace
    # webdev icons
    # whichkey
    # whitespace (remove trailing spaces)
    # wilder
    # yanky
    # gitsigns
    

    treesitter = {
      enable = true;
      highlight.enable = true;
      indent.enable = true;
      folding.enable = true;

      # install grammer packages

    };

    telescope = {
      enable = true;
      keymaps = {
        "<leader>fg" = "live_grep";

      };
    };

    # harpoon = {
    #   enable = true;
    #   enableTelescope = true;
    #   settings = {
    #       settings = {    
    #         save_on_toggle = true;
    #         sync_on_ui_close = false;
    #       };
    #   };
    #
    # };

    indent-blankline = {
      enable = true;
      settings = {
        exclude = {
          buftypes = [
            "terminal"
            "quickfix"
          ];
          filetypes = [
            ""
            "checkhealth"
            "help"
            "lspinfo"
            "packer"
            "TelescopePrompt"
            "TelescopeResults"
            "yaml"
          ];
        };

        indent = {
          char = "│";
        };
        scope = {
          show_end = false;
          show_exact_scope = true;
          show_start = false;
        };
      };
    };
    
    # indent-tools = {
    #   enable = true;
    # };
    
    # leetcode = {
    #   enable = true;
    #   settings = {
    #     lang = "cpp";
    #     storage = {
    #       cache = "~/.cache/nvim/leetcode-nvim";
    #       home = "~/projects/leetcode";
    #     };
    #   };
    # };    
  
    lualine = {
      enable = true;
    };
      
    neo-tree = {
      enable = true;
  
      settings = {
        close_if_last_window = true;
        filesystem = {
          follow_current_file = {
            enabled = true;
            leave_dirs_open = true;
          };
        };
      };
    };

    showkeys = {
      enable = true;
      settings = {
        keyformat = {
          "<CR>" = "Enter";
        };
        maxkeys = 5;
        position = "top-right";
        timeout = 5;  
      };
    };

    timerly = {
      enable = true;
      settings = {
        minutes = [
          30
          10
        ];
      };
    };
    
    web-devicons = {
      enable = true;
      settings = {
        color_icons = true;
        strict = true;
      };
    };

    tiny-devicons-auto-colors = {
      enable = true;
    };
    tiny-glimmer = {
      enable = true;
      settings = {};
    };
    tiny-inline-diagnostic = {
      enable = true;
      settings = {};
    };

    smear-cursor = {
      enable = true;
      settings = {
        distance_stop_animating = 0.5;
        hide_target_hack = false;
        stiffness = 0.8;
        trailing_stiffness = 0.5;
      };
    };

  };
}
