{ pkgs, ... }:
{ 
  # Enable vim
  programs.vim = {
    enable = true;
    defaultEditor = true;

    plugins = [ pkgs.vimPlugins.nerdtree pkgs.vimPlugins.nerdtree-git-plugin ];

    settings = {
      
      # background = "dark";
      number = true;
      relativenumber = true;
      expandtab = true;
      tabstop = 2;
      shiftwidth = 2;
     
      mouse = "c";
      mousefocus = true;
      copyindent = true;
     
      # undofile = false;
      # undodir = [ "~/.vim/undo" ];
      ignorecase = true;
      smartcase = true;
      modeline = false;
      history = 100;
     
      hidden = true;
    };
    extraConfig = builtins.readFile ../EmbeddedDots/vimrc;

  };
}
