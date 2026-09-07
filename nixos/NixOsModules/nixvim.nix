{ inputs , pkgs,  ... }:

{
  # Enable NixVim
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    nixpkgs.useGlobalPackages = true;

    vimdiffAlias = true;
    viAlias = true;
    vimAlias = true;

    colorschemes.rose-pine.enable = true;
    
    opts = {
      number = true;
      relativenumber = true;
    };
  };
  

}
