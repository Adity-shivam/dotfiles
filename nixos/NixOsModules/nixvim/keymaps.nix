{ config, lib, ... }:

{
  programs.nixvim.globals.mapleader = " ";
  programs.nixvim.globals.maplocalleader = " ";

  programs.nixvim.keymaps = [
    {
      # mode = "nv";
      action = "<cmd>Neotree<CR>";
      key = "\\";
      options = {
        silent = true;
      };
    }

    {
      mode = "n";
      key = <Esc>;
      action = "<cmd>nohlsearch<CR>";
      options = {
        silent = true;
        # noremap = true; # defaults to true i.e no recursive binds
      };
    }


  ];


  
}
