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
                  val = "⏻ Quit Neovim";
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
          # "gitcommit"
          # "scratch"
        ];
        nested_checkboxes = 0; 

      };
    };

    # Web browser grammer plugin
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
        "<leader>fh" = "help_tags";
        "<leader>ff" = "find_files";
        "<leader>fb" = "builtin";
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
          window.mappings = { "\\" = "close_window"; };
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
    
    notify.enable = true;
    timerly = {
      enable = true;
      settings = {
        minutes = [
          30
          10
        ];
        position = "bottom-right";
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
      settings = {
        overwrite.paste.default_animation = "fade";
        animations = {
          fade = {
            chars_for_max_duration = 10;
            max_duration = 400;
            min_duration = 300;
            easing = "outQuad";
            from_color = "Search";
            to_color = "Normal";
          };
        };
        refresh_interval_ms = 5;
      };
    };
    tiny-inline-diagnostic = {
      enable = true;
      settings = {};
    };

    smear-cursor = {
      enable = true;
      # settings = {
      #   distance_stop_animating = 0.5;
      #   hide_target_hack = false;
      #   stiffness = 0.8;
      #   trailing_stiffness = 0.5;
      # };
    };
    
    # gitsign or gitgutter
    gitsigns = {
      enable = true;
      settings = {
        signs = {
          add.text = "+";
          change.text = "~";
          delete.text = "_";
          topdelete.text = "‾";
          changedelete.text = "~";
          untracked.text = "•"; 
        };
      };
    };

    nerdy = {
      enable = true;
      enableTelescope = true;
      callSetup = true;
    };

    # wilder = {
    #   enable = true;
    #   options = {
    #     renderer = lib.nixvim.mkRaw ''
    #     wilder.popupmenu_renderer(
    #       wilder.popupmenu_border_theme({
    #         highlights = { border = 'Normal' },
    #         border = 'rounded',
    #         -- pumblend = 20,
    #       })
    #     )
    #   '';
    #   };
    #
    #   settings = {
    #     modes = [
    #       ":"
    #       "/"
    #       "?"
    #     ];
    #     next_key = "<Tab>";
    #     previous_key = "<S-Tab>";
    #   };
    # };

    smartcolumn = {
      enable = true;
      settings = {
        colorcolumn = "80";
        custom_colorcolumn = {
          go = [
            "100"
            "130"
          ];
          java = [
            "100"
            "140"
          ];
          nix = [
            "100"
            "120"
          ];
          rust = [
            "80"
            "100"
          ];
          cpp = [
            "80"
            "100"
          ];
          c = [
            "80"
            "100"
          ];
        };
        disabled_filetypes = [
          "checkhealth"
          "help"
          "lspinfo"
          "markdown"
          "neo-tree"
          "noice"
          "text"
        ];
        scope = "window";
      };

    };
  
    # comfy-line-numbers.enable = true;
    # twilight.enable = true;
    # which-key.enable = true;
    # transparent.enable = true;
    # multicursor.enable = true;
    
    # Neoclip or Yanky
    neoclip.enable = true;
    # yanky = {
    #   enable = true;
    #   enableTelescope = true;
    # };

    todo-comments = {
      enable = true;
      settings.colors = {
        default = [
          "Identifier"
          "#7C3AED"
        ];
        error = [
          "DiagnosticError"
          "ErrorMsg"
          "#DC2626"
        ];
        hint = [
          "DiagnosticHint"
          "#10B981"
        ];
        info = [
          "DiagnosticInfo"
          "#2563EB"
        ];
        test = [
          "Identifier"
          "#FF00FF"
        ];
        warning = [
          "DiagnosticWarn"
          "WarningMsg"
          "#FBBF24"
        ];
      };
      settings.keywords ={
        FIX = {
          alt = [
            "FIXME"
            "BUG"
            "FIXIT"
            "ISSUE"
          ];
          color = "error";
          icon = " ";
        };
        HACK = {
          color = "warning";
          icon = " ";
        };
        NOTE = {
          alt = [
            "INFO"
          ];
          color = "hint";
          icon = " ";
        };
        PERF = {
          alt = [
            "OPTIM"
            "PERFORMANCE"
            "OPTIMIZE"
          ];
          icon = " ";
        };
        TEST = {
          alt = [
            "TESTING"
            "PASSED"
            "FAILED"
          ];
          color = "test";
          icon = "⏲ ";
        };
        TODO = {
          color = "info";
          icon = " ";
        };
        WARN = {
          alt = [
            "WARNING"
            "XXX"
          ];
          color = "warning";
          icon = " ";
        };
      };
    };

    intellitab.enable = true;  

    # Visible Whitespaces 
    # whitespace.enable = true;     
    # visual-whitespace.enable = true;

    # undotree.enable = true;   
  
    # Comment
    commentary.enable = true;
    # comment = {
    #   enable = true;
    # };
    
  };
}
