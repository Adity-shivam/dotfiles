{ inputs , pkgs,  ... }:

{

  imports = [ 
    ./opts.nix
    ./plugins.nix
    ./keymaps.nix
  ];
	
  # Enable NixVim
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    nixpkgs.useGlobalPackages = true;

    viAlias = true;
    vimAlias = true;

    colorschemes.rose-pine.enable = true;
    
 

  };
}
