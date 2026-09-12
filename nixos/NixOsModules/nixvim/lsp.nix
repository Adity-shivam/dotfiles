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
  programs.nixvim.extraConfigLua = ''
    vim.diagnostic.config {
      update_in_insert = false,
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      underline = { severity = { min = vim.diagnostic.severity.WARN } },

      -- Can switch between these as you prefer
      virtual_text = true, -- Text shows up at the end of the line
      virtual_lines = false, -- Text shows up underneath the line, with virtual lines

      -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
      jump = { float = true },
    }

    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

  '';

  programs.nixvim.extraPackages = [
    # required by Astro formatter
    pkgs.prettier
    # required by JSON / YAML / JS / TS / HTML / CSS / Markdown formatter
    pkgs.oxfmt
    # required by shell script formatter
    pkgs.air
    # required by OCaml formatter
    pkgs.ocamlPackages.ocamlformat
    # required by Haskell formatter
    pkgs.haskellPackages.fourmolu
    # required by Typst formatter
    pkgs.typstyle
    # required by C formatter (clang-format)
    pkgs.clang-tools
    # required by Java formatter
    pkgs.google-java-format
    # required by Go formatter
    pkgs.gofumpt
    # required by TOML formatter
    pkgs.taplo
    # required by Python formatter
    pkgs.ruff
    # required by Makefile formatter
    pkgs.mbake
    # required by Makefile linter
    pkgs.checkmake
    # required by LaTeX formatter (latexindent) and TeX compilation toolchain
    pkgs.texliveFull
    # required for nix formatter
    pkgs.nixfmt
  ];

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
      settings = {
        format_on_save = {
          lsp_format = "fallback";
          timeout_ms = 2000;
        };
        formatters_by_ft = {
          # nix formatter
          nix = [ "nixfmt" ];
          # Markdown formatter
          markdown = [ "oxfmt" ];
          # shell script formatter (sh, bash, zsh)
          sh = [ "shfmt" ];
          bash = [ "shfmt" ];
          zsh = [ "shfmt" ];
          # OCaml formatter
          ocaml = [ "ocamlformat" ];
          # Haskell formatter
          haskell = [ "fourmolu" ];
          # Typst formatter
          typst = [ "typstyle" ];
          # C formatter
          c = [ "clang_format" ];
          # Python formatter
          python = [ "ruff_format" ];
          # HTML formatter
          html = [ "oxfmt" ];
          # CSS formatter
          css = [ "oxfmt" ];
          # Java formatter
          java = [ "google-java-format" ];
          # Go formatter
          go = [ "gofumpt" ];
          # TOML formatter
          toml = [ "taplo" ];
          # JSON / JSONC formatter
          json = [ "oxfmt" ];
          jsonc = [ "oxfmt" ];
          # YAML formatter
          yaml = [ "oxfmt" ];
          # Rust formatter
          rust = [ "rustfmt" ];
          # JavaScript / TypeScript
          javascript = [ "oxfmt" ];
          typescript = [ "oxfmt" ];
          # LaTeX formatter
          tex = [ "latexindent" ];
          # Makefile formatter
          make = [ "bake" ];
        };
      };
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

    # cmp = {
    #   autoEnableSources = true;
    #   settings.sources = [
    #     { name = "nvim_lsp"; }
    #     { name = "path"; }
    #     { name = "buffer"; }
    #   ];
    # };

    blink-cmp = {
      enable = true;
      setupLspCapabilities = true;
      settings = {
        appearance = {
          nerd_font_variant = "normal";
          use_nvim_cmp_as_default = true;
        };
        completion = {
          accept = {
            auto_brackets = {
              enabled = true;
              semantic_token_resolution = {
                enabled = false;
              };
            };
          };
          documentation = {
            auto_show = true;
          };
        };
        keymap = {
          preset = "super-tab";
        };
        signature = {
          enabled = true;
        };
        sources = {
          cmdline = [ ];
          providers = {
            buffer = {
              score_offset = -7;
            };
            lsp = {
              fallbacks = [ ];
            };
          };
        };
      };

    };

  };

}

