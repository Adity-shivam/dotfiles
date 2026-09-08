{ config, lib, ... }:

{
  programs.nixvim.globals.mapleader = " ";
  programs.nixvim.globals.maplocalleader = " ";

  programs.nixvim.keymaps = [
    {
      action = "<cmd>Neotree<CR>";
      key = "\\";
      options = {
        silent = true;
      };
    };
  ];


  
}
