{ pkgs, inputs, ... }:

let 
  lib = inputs.nixvim.lib;
in

  # TODO: add plugins

  # dap debug 
  # mini | autopair | autoclose
  # snacks

  # persistnace | tmux
  # neorg

  # Web browser grammer plugin

{

  programs.nixvim.plugins.treesitter = {
    enable = true;
    highlight.enable = true;
    indent.enable = true;
    folding.enable = true;

    # install grammer packages
    nixGrammars = true;
    nixvimInjections = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
  };
 
  # programs.nixvim.plugins.treesitter-refactor = {
  #   enable = true;
  #   highlightDefinitions = {
  #     enable = true;
  #     # Set to false if you have an `updatetime` of ~100.
  #     clearOnCursorMove = false;
  #   };
  # };


  programs.nixvim.lsp = {
    servers = {
      "*" = {
        config = {
          capabilities = {
            textDocument = {
              semanticTokens = {
                multilineTokenSupport = true;
              };
            };
          };
          root_markers = [
            ".git"
          ];
        };
      };
      clangd = {
        config = {
          cmd = [
            "clangd"
            "--background-index"
          ];
          filetypes = [
            "c"
            "cpp"
          ];
          root_markers = [
            "compile_commands.json"
            "compile_flags.txt"
          ];
        };
        enable = true;
      };
      lua_ls = {
        enable = true;
      };
      nixd = {
        enable = true;
        config = {
          settings = {
            nixd = {
              options = {
                nixos = {
                  expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.Nix-Chan.options";
                };
              };
            };
          };
        };
      };


    };

  };
  
  programs.nixvim.plugins = {
    
    # cmake-tools = {
    #   enable = true;
    # };

    luasnip = {
      enable = true;
    };

    quicker = {
      enable = true;
    };
    
    conform-nvim = {
      enable = true;
    };

    lint = {
      enable = true;
    };
    
      nvim-ufo = {
      enable = true;
    };

    nvim-surround = {
      enable = true;
    };
    
    cmp = {
      autoEnableSources = true;
      settings.sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
      ];
    };
  
  
  };

}
