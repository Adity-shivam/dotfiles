{ config, lib, ... }:

{
  programs.nixvim.globals.mapleader = " ";
  programs.nixvim.globals.maplocalleader = " ";

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "\\";
      action = "<cmd>Neotree reveal<CR>";
      options = {
        desc = "open neotree";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>nohlsearch<CR>";
      options = {
        desc= "remove search higlight";
        silent = true;
        # noremap = true; # defaults to true i.e no recursive binds
      };
    }

    {
       mode = "n";
       key = "<C-h>";
       action = "<C-w><C-h>";
       options.desc = "Move focus to the left window";
     }
     {
       mode = "n";
       key = "<C-l>";
       action = "<C-w><C-l>";
       options.desc = "Move focus to the right window";
     }
     {
       mode = "n";
       key = "<C-j>";
       action = "<C-w><C-j>";
       options.desc = "Move focus to the lower window";
     }
     {
       mode = "n";
       key = "<C-k>";
       action = "<C-w><C-k>";
       options.desc = "Move focus to the upper window";
     }

  ];
  
  # Cmdline abbreviation
  programs.nixvim.extraConfigVim = ''
    cabbrev <expr> W getcmdtype() == ':' && getcmdline() ==# 'W' ? 'w' : 'W'
    cabbrev <expr> Wq getcmdtype() == ':' && getcmdline() ==# 'Wq' ? 'wq' : 'Wq'    
    cabbrev <expr> Wqa getcmdtype() == ':' && getcmdline() ==# 'Wqa' ? 'wqa' : 'Wqa'
    cabbrev <expr> WQ getcmdtype() == ':' && getcmdline() ==# 'WQ' ? 'wq' : 'WQ'
    cabbrev <expr> WQa getcmdtype() == ':' && getcmdline() ==# 'WQa' ? 'wqa' : 'WQa'
    cabbrev <expr> WQA getcmdtype() == ':' && getcmdline() ==# 'WQA' ? 'wqa' : 'WQA'
    cabbrev <expr> Q getcmdtype() == ':' && getcmdline() ==# 'Q' ? 'q' : 'Q'
    cabbrev <expr> Qa getcmdtype() == ':' && getcmdline() ==# 'Qa' ? 'qa' : 'Qa'
    cabbrev <expr> QA getcmdtype() == ':' && getcmdline() ==# 'QA' ? 'qa' : 'QA'
  '';
}
