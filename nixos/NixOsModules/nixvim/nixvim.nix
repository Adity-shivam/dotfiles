{ inputs, pkgs, ... }:

{

  imports = [
    ./opts.nix
    ./plugins.nix
    ./lsp.nix
    ./keymaps.nix
    ./autocmd.nix
  ];

  # Enable NixVim
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    nixpkgs.useGlobalPackages = true;

    viAlias = true;
    vimAlias = true;

    colorschemes = {
      # tokyonight.enable = true;
      # colorschemes.rosepine.enable = true;
      nightfox = {
        enable = true;
        flavor = "nightfox";
      };
    };
  };
}

